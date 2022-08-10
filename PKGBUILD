# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=sport-activities-features
pkgname=python-${_base}
pkgdesc="Minimalistic toolbox for extracting features from sports activity files written in Python"
pkgver=0.3.3
pkgrel=1
arch=(any)
url="https://github.com/firefly-cpp/${_base}"
license=(MIT)
depends=(python-matplotlib python-geopy python-tcxreader python-requests python-niaaml python-overpy python-gpxpy python-geotiler python-dotmap)
makedepends=(python-build python-install python-poetry-core)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('21bbaa782071ec2f981897eab79e04b748ff49443f6b1ec9d1fdd316a1c99072d531c3faa2c9d7526f9fae27b977732cd3f91cf57617261a7181c164ab3cec19')

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
