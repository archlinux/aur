# Maintainer: Umar Alfarouk <medrivia@gmail.com>

_pkgname=fastembed
pkgname=python-fastembed
pkgver=0.7.4
pkgrel=1
pkgdesc="Fast, lightweight Python library for embedding generation using ONNX Runtime"
arch=('x86_64' 'aarch64')
url="https://github.com/qdrant/fastembed"
license=('Apache-2.0')
depends=(
  'python'
  'python-numpy'
  'python-onnxruntime'
  'python-tqdm'
  'python-requests'
  'python-tokenizers'
  'python-huggingface-hub'
  'python-loguru'
  'python-pillow'
  'python-mmh3'
  'python-py-rust-stemmers'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-poetry-core'
)
provides=('python-fastembed')
conflicts=('python-fastembed')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/qdrant/fastembed/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c39b9b7a4fed5ab0e0d9ec8a96a36022a352c63bdf152110cddf1c2bb0df94bd')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
