# Maintainer: SteamedFish <steamedfish@hotmail.com>
pkgname=python-wtpsplit
pkgver=2.2.1
pkgrel=2
pkgdesc="Universal, robust, efficient, and adaptable sentence segmentation"
arch=('any')
url="https://github.com/segment-any-text/wtpsplit"
license=('MIT')
depends=(
  'python'
  'python-transformers'
  'python-huggingface-hub'
  'python-numpy'
  'python-scikit-learn'
  'python-tqdm'
  'python-pandas'
  'python-mosestokenizer'
  'python-pytorch'
  'python-h5py'
  'python-datasets'
  'python-regex'
  'python-requests'
  'python-tokenizers'
  'python-accelerate'
  'python-packaging'
)
optdepends=(
  'python-skops: scikit-learn model persistence'
  'python-onnxruntime: ONNX CPU inference backend'
  'python-onnxruntime-opt-cuda: ONNX GPU inference backend (CUDA)'
  'python-onnxruntime-opt-rocm: ONNX GPU inference backend (ROCm)'
  # python-adapters: adapter-based fine-tuning (not packaged; install via pip)
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("https://files.pythonhosted.org/packages/5a/1b/eb2f7ef0be37f9e8909005ca90366e7cb6a72ec8893467bd83fe69763dc7/wtpsplit-${pkgver}.tar.gz")
sha256sums=('e72faf6df558fa45fdaa24ab2de28b7b61ad9c69900bc08041b7d479e6b9f5b7')

build() {
  cd "wtpsplit-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "wtpsplit-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
