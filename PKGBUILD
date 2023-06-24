# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=AST-Monitor
pkgname=python-${_base,,}
pkgdesc="A wearable Raspberry Pi computer for cyclists"
pkgver=0.3.3
pkgrel=1
arch=(any)
url="https://github.com/firefly-cpp/${_base}"
license=(MIT)
depends=(python-sport-activities-features python-pyqt-feedback-flow python-pyqt5-webengine qt5-svg python-openant)
makedepends=(python-build python-installer python-poetry-core)
checkdepends=(python-pytest)
optdepends=('python-openant: for ANT sensor support'
  'python-adafruit-circuitpython-gps: for GPS sensor support'
  'python-serial: for serial communication support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('d423d3460cfb2548452e14707d9ae69a2610388c64c9d7b4a2decadbad2d4ae852bd6deae543e7d1074d3bbd69547c971122fc2695d88bfd74dc0ef53fc34802')

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
