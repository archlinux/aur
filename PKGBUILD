# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Labello <sebastian.semper@tu-ilmenau.de>
_base=fastmat
pkgname=python-${_base}
pkgver=0.2.post0
pkgrel=1
pkgdesc="fast linear transforms in Python"
arch=('x86_64')
url="https://pypi.org/project/${_base}"
license=(Apache2)
depends=(python-scipy)
makedepends=(cython python-setuptools)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('a1735f92e7088a915f352480beece7b95e4efd6d75062fbaabc727b28fe0927e70aecf37f592a0e43320ab7536d2602835ddc17524ae24b2d89c309ffd3aea66')

build() {
  cd ${_base}-${pkgver}
  make compile
}

package() {
  cd ${_base}-${pkgver}
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
