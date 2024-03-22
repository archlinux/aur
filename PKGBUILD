# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
# Contributor: Filip Graliński <filipg@amu.edu.pl>

pkgname=python-transformers
_pkgname=${pkgname#python-}
pkgver=4.39.0
pkgrel=1
pkgdesc="State-of-the-art Natural Language Processing for Jax, PyTorch and TensorFlow"
arch=('any')
url='https://github.com/huggingface/transformers'
license=('Apache')
# TODO: Remove constraint on python-tokenizers in the future releases.
depends=(
  'python-filelock'
  'python-huggingface-hub'
  'python-numpy'
  'python-packaging'
  'python-regex'
  'python-requests'
  'python-safetensors'
  'python-tokenizers>=0.14'
  'python-tokenizers<0.19'
  'python-tqdm'
  'python-yaml'
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=(
  'python-bitsandbytes: 8-bit support for PyTorch'
  'python-flax: JAX support'
  'python-onnxconverter-common: TensorFlow support'
  'python-pytorch: PyTorch support'
  'python-tensorflow: TensorFlow support'
  'python-tf2onnx: TensorFlow support'
)
source=(
  "python-transformers-$pkgver.tar.gz"::"https://github.com/huggingface/transformers/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('dadc4e4dd0851c55d8d9aa5aa937e7db8c62bf791aa218af885641b6518eb0f7')

build() {
  python -m build -nw "transformers-$pkgver"
}

package() {
  cd "transformers-$pkgver"
  python -m installer \
    --compile-bytecode 1 \
    --destdir $pkgdir \
    $srcdir/$_pkgname-$pkgver/dist/transformers-$pkgver-*-*.whl
}
