# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: dreieck <oid-maps@seznam.cz>
_base=fortranformat
pkgname=python-${_base}
pkgdesc="Mimics Fortran textual IO in Python"
pkgver=1.2.0
pkgrel=1
arch=(any)
url="https://github.com/brendanarnold/py-${_base}"
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('9c6910dca41738c18988351554b199721efd0a461362fcb712a76a2be3ccba540afdd893ef70bee8f492639039f7fd0e7c35289db405a4a410d53be8f4388516')

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
