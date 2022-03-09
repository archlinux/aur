# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Richard PALO <richard.palo@free.fr>
_base=proteus
pkgname=python-${_base}
pkgver=6.2.2
pkgrel=1
pkgdesc="Library to access Tryton server as a client"
arch=(any)
url="https://www.tryton.org"
license=(LGPL3)
depends=(python-defusedxml python-dateutil)
makedepends=(python-setuptools)
optdepends=('python-trytond: Trytond server')
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('063045d652be807b00c28599a4d6015a594bb125b044b6187cb86e5d331b3a5b731ef2eab2ced3c0b896a484bc20b9b54b6a86cefd09186373897f1c6114af74')

build() {
  cd ${_base}-${pkgver}
  export PYTHONHASHSEED=0
  python setup.py build
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
