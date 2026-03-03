# Maintainer: SteamedFish <steamedfish@hotmail.com>
pkgname=python-wtpsplit
pkgver=2.2.0
pkgrel=1
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
source=("https://files.pythonhosted.org/packages/b5/0d/2078e6b6a735f13bfc51803e72da6a574b1d55923e422a94a1b4db0969e7/wtpsplit-${pkgver}.tar.gz")
sha256sums=('188a2e785ba39e05f69260367401d33fc896498126e330149f432affaab5af08')

build() {
  cd "wtpsplit-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "wtpsplit-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
