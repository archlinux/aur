# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Labello <sebastian.semper@tu-ilmenau.de>
_base=fastmat
pkgname=python-${_base}
pkgver=0.2.2
pkgrel=1
pkgdesc="fast linear transforms in Python"
arch=('x86_64')
url="https://pypi.org/project/${_base}"
license=(Apache2)
depends=(python-scipy)
makedepends=(cython python-setuptools)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('02f44bc4363c0b056154a205e1f7e0cf7a98187dc5556586769832489ac7d7d2315463ddabbed1d5d266316374d990ee3eb1bd92ee73bf8b55518df7223263da')

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
