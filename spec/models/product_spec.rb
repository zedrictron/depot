require 'rails_helper'

describe Product do
  describe 'validations' do
    context 'when title is blank' do
      let!(:product) { FactoryGirl.build(:product, title: '')}

      it 'returns an error' do
        expect(product.valid?).to be false
      end
      it 'returns an error message' do
        product.save
        expect(product.errors.count).to eq 1
      end
    end

    context 'when title already exists' do
      let!(:product1) { FactoryGirl.build(:product, title: '')}
      let!(:product2) { FactoryGirl.build(:product, title: '')}

      it 'becomes invalid' do
        expect(product2.valid?). to be false
      end

      it 'returns an error message' do
        product2.save
        expect(product2.errors.count).to eq 1
      end
    end
  end
end
