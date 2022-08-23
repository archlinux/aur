# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: dreieck <oid-maps@seznam.cz>
_base=fortranformat
pkgname=python-${_base}
pkgdesc="Mimics Fortran textual IO in Python"
pkgver=1.2.2
pkgrel=1
arch=(any)
url="https://github.com/brendanarnold/py-${_base}"
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('28b020098e92186373326afc8f2a631b42616e04e0d0b3af6e6875eff3c17e0528c7ca08705f0ff4a59992f7f997b9ca01c92e1199d81a2a60eae54be7486d08')

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
