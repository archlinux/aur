# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=AST-Monitor
pkgname=python-${_base,,}
pkgdesc="A wearable Raspberry Pi computer for cyclists"
pkgver=0.5.5
pkgrel=1
arch=(any)
url="https://github.com/firefly-cpp/${_base}"
license=(MIT)
depends=(python-sport-activities-features python-openant python-pyqt6-webengine python-pyqt-feedback-flow qt6-svg)
makedepends=(python-build python-installer python-poetry-core)
checkdepends=(python-pytest-qt)
optdepends=('python-openant: for ANT sensor support'
  'python-adafruit-circuitpython-gps: for GPS sensor support'
  'python-serial: for serial communication support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('fa175c7a84a193d4e3bdcadaeb6c28cf362e0963cd8650dd99a8f3c225ee3397db5173d13a603d1c12b7d173c984591e6bfa858012611b88c871e15d4c037cd1')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m pytest
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --prefix=/usr --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
