# Contributor: Filip Graliński <filipg@amu.edu.pl>
# Contributor: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-transformers
_pkgname=${pkgname#python-}
pkgver=4.29.0
pkgrel=1
pkgdesc="State-of-the-art Natural Language Processing for Jax, PyTorch and TensorFlow"
arch=('any')
url='https://github.com/huggingface/transformers'
license=('Apache')
depends=(
  'python-filelock'
  'python-huggingface-hub'
  'python-numpy'
  'python-packaging'
  'python-regex'
  'python-requests'
  'python-tokenizers'
  'python-tqdm'
  'python-yaml'
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=(
  'python-flax: JAX support'
  'python-onnxconverter-common: TensorFlow support'
  'python-pytorch: PyTorch support'
  'python-tensorflow: TensorFlow support'
  'python-tf2onnx: TensorFlow support'
)
source=(
  "python-transformers-$pkgver.tar.gz"::"https://github.com/huggingface/transformers/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('5b3b87a64aef161843eeb7513de78692b0f1d7a32ef5068f8517295673ba1338')

build() {
  cd "transformers-$pkgver"
  python -m build -n -w
}

package() {
  cd "transformers-$pkgver"
  python -m installer \
    --compile-bytecode 1 \
    --destdir $pkgdir \
    $srcdir/$_pkgname-$pkgver/dist/transformers-$pkgver-*-*.whl
}
