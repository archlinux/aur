# Maintainer: Umar Alfarouk <medrivia@gmail.com>

_pkgname=py-rust-stemmers
pkgname=python-py-rust-stemmers
pkgver=0.1.5
pkgrel=1
pkgdesc="Fast and parallel snowball stemmer"
arch=('x86_64' 'aarch64')
url="https://github.com/qdrant/py-rust-stemmers"
license=('MIT')
depends=('python')
makedepends=(
  'cargo'
  'python-build'
  'python-installer'
  'python-maturin'
  'python-wheel'
)
provides=('python-py-rust-stemmers')
conflicts=('python-py-rust-stemmers')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/qdrant/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('415d55d9e0dc5775ef41ba727f72e8eda6e8c0e2a9e4897bb811de5eef92e7ba')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
