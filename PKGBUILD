# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Richard PALO <richard.palo@free.fr>
_base=proteus
pkgname=python-${_base}
pkgver=6.8.0
pkgrel=1
pkgdesc="Library to access Tryton server as a client"
arch=(any)
url="https://www.tryton.org"
license=(LGPL3)
depends=(python-defusedxml python-dateutil)
makedepends=(python-setuptools)
optdepends=('python-trytond: Trytond server')
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('46b47ecc564aad4b222aeb84321d0503e791ca7a3df14c7295d1ed9093ea94e881a22d376dcd2e0b8e07a3f1d338800616957139631b86292b6e897e4b959470')

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
