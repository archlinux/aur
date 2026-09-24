# Maintainer: Umar Alfarouk <medrivia@gmail.com>

_pkgname=fastembed
pkgname=python-fastembed
pkgver=0.8.1
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
provides=("python-fastembed=$pkgver")
conflicts=('python-fastembed')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/qdrant/fastembed/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4c3b10a91accb90884e825d21253693eea9c748ea24584c6f820361918a7502d')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
