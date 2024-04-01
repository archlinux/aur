# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Labello <sebastian.semper@tu-ilmenau.de>
_base=fastmat
pkgname=python-${_base}
pkgver=0.2.2.post0
pkgrel=1
pkgdesc="fast linear transforms in Python"
arch=('x86_64')
url="https://pypi.org/project/${_base}"
license=(Apache2)
depends=(python-scipy)
makedepends=(cython python-setuptools)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('e686bfcdec860a8a0b2f21a1550090fbb45ed3d2fd457a4dbb7644ac189edc8e41b7509ee57dbd478a0c70378183b0d93aeb98f0c97289c3bfbcbbbcd1e77565')

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
