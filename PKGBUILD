# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=AST-Monitor
pkgname=python-${_base,,}
pkgdesc="A wearable Raspberry Pi computer for cyclists"
pkgver=0.4.1
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
sha512sums=('9c3a4c9aae81d046d9e36445712ec34bf871de59e05a53681961023f792d5b2f29fe1ca53f82aff63338ceb1c544fa8830564d801587330ef6cd6e49a46b977d')

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
