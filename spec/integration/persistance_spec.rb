describe 'Nanoid persisting documents' do
  before do
    class Document
      include Nanoid::Document

      field :field_1
      field :field_2
    end
  end

  describe 'creating documents' do
    describe "when using #new then #save" do
      it 'persists the fields' do
        doc = Document.new
        doc.field_1 = 'field1'
        doc.field_2 = 'field2'
        doc.save

        doc = Document.find(doc.id)
        doc.field_1.should == 'field1'
        doc.field_2.should == 'field2'
      end
    end

    describe "when using #create" do
      it 'persists the fields' do
        doc = Document.create(:field_1 => 'field1',
                              :field_2 => 'field2')

        doc = Document.find(doc.id)
        doc.field_1.should == 'field1'
        doc.field_2.should == 'field2'
      end
    end
  end
end
