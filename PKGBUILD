# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=py-eddy-tracker-sample
pkgname=python-${_base}
pkgdesc="Py-Eddy-Tracker samples"
pkgver=0.1.0
pkgrel=2
arch=(any)
url="https://github.com/AntSimi/${_base}"
license=(GPL3)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('f48f80f869705ec426c033738b5b41c1e88a39c037159c62a9952d320a658acbeb6d5ae208f17e63ab5835636dcb8655511aa99e3bf1b3d0afddbf2228034440')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
