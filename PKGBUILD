# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=sport-activities-features
pkgname=python-${_base}
pkgdesc="Minimalistic toolbox for extracting features from sports activity files written in Python"
pkgver=0.3.5
pkgrel=1
arch=(any)
url="https://github.com/firefly-cpp/${_base}"
license=(MIT)
depends=(python-matplotlib python-geopy python-tcxreader python-requests python-overpy python-gpxpy python-geotiler python-dotmap python-pandas)
makedepends=(python-build python-install python-poetry-core)
checkdepends=(python-pytest python-niaaml)
optdepends=('python-niaaml: for data analysis')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('63f50f1ea9b74bafffb93f2fde879e59409a87608e8ff628309d97ab5383afeb22aceabb16258581f744ba0afb8b5e9f2d4abfdc0a103c739bce264c0c8cdc95')

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
