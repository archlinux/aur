# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=AABBTree
pkgname=python-${_base,,}
pkgdesc="Pure Python implementation of d-dimensional AABB tree"
pkgver=2.8.1
pkgrel=2
arch=('any')
url="https://github.com/kip-hart/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('602c74c7fcbfde0c5042fdbc611e8f96d5656f05eebf47aceb7169e39d3d0fea46194ea4307ddf3a6a71138c977224c382e0349f408cab1da50796f7f1b68c38')

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

check() {
  cd ${_base}-${pkgver}
  PYTHONPATH="$PWD/build/lib/" python -m pytest
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
