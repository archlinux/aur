# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: dreieck <oid-maps@seznam.cz>
_base=fortranformat
pkgname=python-${_base}
pkgdesc="Mimics Fortran textual IO in Python"
pkgver=1.2.1
pkgrel=1
arch=(any)
url="https://github.com/brendanarnold/py-${_base}"
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('8e9fbc7286b9641568bec1bfcc965f603989dab36e7b315bb20b3225a7b1cad673d2ab9cfd7832fae2e299dd64755d96a089d96097bf870851d156526ba728e3')

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
