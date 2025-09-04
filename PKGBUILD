# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Richard PALO <richard.palo@free.fr>
_base=proteus
pkgname=python-${_base}
pkgver=7.6.1
pkgrel=1
pkgdesc="Library to access Tryton server as a client"
arch=(any)
url="https://www.tryton.org"
license=(LGPL-3.0-or-later)
depends=(python-defusedxml python-dateutil)
makedepends=(python-build python-installer python-setuptools python-wheel)
optdepends=('python-trytond: Trytond server')
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('0a1b954a9c1ca445c5819ef763ad11d0564e26d2b44941a0c603fc43c7fc03a8fcabcae489a906b25a43855f917c9b2471d7a77bb69abd90d82595c01d30d7eb')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
