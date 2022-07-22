# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=AST-Monitor
pkgname=python-${_base,,}
pkgdesc="A wearable Raspberry Pi computer for cyclists"
pkgver=0.2.1
pkgrel=1
arch=(any)
url="https://github.com/firefly-cpp/${_base}"
license=(MIT)
depends=(python-sport-activities-features python-pyqt-feedback-flow python-pyqt5-webengine qt5-svg)
makedepends=(python-build python-install python-poetry-core)
checkdepends=(python-pytest)
optdepends=('python-openant: for ANT sensor support'
  'python-adafruit-circuitpython-gps: for GPS sensor support'
  'python-serial: for serial communication support')
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('b4cced2a5e6f6052943453058a30bbf216d1b7d823b55828bc29ec999be3dc1d6f359b0396790cfeca40e74592eab1c6e968c85d4da48bf7bd24843c39df785a')

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
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m install --optimize=1 --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
