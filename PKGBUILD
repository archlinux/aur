# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: dreieck <oid-maps@seznam.cz>
_base=fortranformat
pkgname=python-${_base}
pkgdesc="Mimics Fortran textual IO in Python"
pkgver=1.1.1
pkgrel=2
arch=(any)
url="https://github.com/brendanarnold/py-${_base}"
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('39268216ea104c8ca03b7e53c3077e845f375f4a1fe7f0336a030cae7a21034fbb1d0b287ec08b012ece3e81a999dcfd50dece410b6abd4b937d81d67922853d')

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
