# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Moritz Kaspar Rudert (mortzu) <mortzu@riseup.net>
_base=downwards
pkgname=python-${_base}
pkgver=1.3.1
pkgrel=2
pkgdesc="Read Wikipedia pages as manpages"
arch=(any)
url="https://github.com/noqqe/${_base}"
license=(MIT)
depends=(python-click python-wikipedia python-wikitextparser python-mako python-unidecode man-db)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('56762a54307950d76cf046d9f2f1a066733e685c632264f566368429c3d8311dc158232f053c9a65f9d75f04769e2302e91b81ee301cda5f0c52dcbc3bc6071f')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
