# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Richard PALO <richard.palo@free.fr>
_base=proteus
pkgname=python-${_base}
pkgver=7.4.0
pkgrel=1
pkgdesc="Library to access Tryton server as a client"
arch=(any)
url="https://www.tryton.org"
license=(LGPL-3.0-or-later)
depends=(python-defusedxml python-dateutil)
makedepends=(python-build python-installer python-setuptools python-wheel)
optdepends=('python-trytond: Trytond server')
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('b6b6e345b97c8d21cb120eaf261f4bb02f6dab6acd1487798dc560ae198dcff2ebfe2d00f7a9e4e8246846a65fab031f9c645c95dc34b6a54fe9f8bf83133e4e')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
