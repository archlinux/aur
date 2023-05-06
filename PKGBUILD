# Maintainer: Jose Riha <jose1711 gmail com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Ren Tatsumoto <tatsu at autistici dot org>

_base=imutils
pkgname=python-${_base}
pkgdesc="A series of convenience functions to make basic image processing asier with OpenCV"
pkgver=0.5.4
pkgrel=3
arch=(any)
url="https://github.com/jrosebr1/${_base}"
license=(MIT)
depends=(python-opencv hdf5)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('50f9b43842cac55055a94d277fea958b8593bbc9b249878cc7e545368220667cb853d059c9ea412d034220c240343fe5e009e407554a10da958822d6e7e30728')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}
