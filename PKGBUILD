# Contributor: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-transformers-pytorch
_pkgname=${pkgname#python-}
_pkgname=${_pkgname%-pytorch}
pkgver=4.30.2
pkgrel=1
pkgdesc='State-of-the-art Natural Language Processing for Jax, PyTorch and TensorFlow'
arch=('any')
url='https://github.com/huggingface/transformers'
license=('Apache')
groups=('huggingface')
depends=(
  'python-accelerate'
  'python-filelock'
  'python-huggingface-hub'
  'python-numpy'
  'python-packaging'
  'python-pytorch'
  'python-regex'
  'python-requests'
  'python-safetensors'
  'python-sentencepiece'
  'python-tokenizers'
  'python-tqdm'
  'python-yaml'
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=(
  'python-flax: JAX support'
  'python-onnxconverter-common: TensorFlow support'
  'python-tensorflow: TensorFlow support'
  'python-tf2onnx: TensorFlow support'
)
conflicts=('python-transformers')
provides=("python-transformers=$pkgver")
source=(
  "python-$_pkgname-$pkgver.tar.gz"::"https://github.com/huggingface/$_pkgname/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('db39e409fb02a39b59f0f4dcb37fc115bcf35459ab65153c776a7ccbcfc02e9f')

build() {
  python -m build -nw "transformers-$pkgver"
}

package() {
  python -m installer \
    --compile-bytecode 1 \
    --destdir $pkgdir \
    $srcdir/$_pkgname-$pkgver/dist/transformers-$pkgver-*-*.whl
}
