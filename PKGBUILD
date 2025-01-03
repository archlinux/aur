# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Richard PALO <richard.palo@free.fr>
_base=proteus
pkgname=python-${_base}
pkgver=7.4.1
pkgrel=1
pkgdesc="Library to access Tryton server as a client"
arch=(any)
url="https://www.tryton.org"
license=(LGPL-3.0-or-later)
depends=(python-defusedxml python-dateutil)
makedepends=(python-build python-installer python-setuptools python-wheel)
optdepends=('python-trytond: Trytond server')
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('3f27678e9a765fb892502e013d0d53ed1c591ce20112ea79f02812cab669aa63b5f6d3a924da4925144c5e3b3bf6fc9903153a3840975be3af8298ee9fc21153')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
