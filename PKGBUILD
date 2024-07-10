# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=AST-Monitor
pkgname=python-${_base,,}
pkgdesc="A wearable Raspberry Pi computer for cyclists"
pkgver=0.5.1
pkgrel=1
arch=(any)
url="https://github.com/firefly-cpp/${_base}"
license=(MIT)
depends=(python-sport-activities-features python-openant python-pyqt6-webengine python-pyqt-feedback-flow qt6-svg)
makedepends=(python-build python-installer python-poetry-core)
checkdepends=(python-pytest)
optdepends=('python-openant: for ANT sensor support'
  'python-adafruit-circuitpython-gps: for GPS sensor support'
  'python-serial: for serial communication support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('35b97d4d114b94250eda9c7071bfe06fb95c0ac19574f855171363e4b1f142573ee64fd41ebb3167cd018d453c88fedb4e37790ca3f4e9e4875a50c673b10f69')

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
