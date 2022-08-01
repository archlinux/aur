# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=sport-activities-features
pkgname=python-${_base}
pkgdesc="Minimalistic toolbox for extracting features from sports activity files written in Python"
pkgver=0.3.1
pkgrel=1
arch=(any)
url="https://github.com/firefly-cpp/${_base}"
license=(MIT)
depends=(python-matplotlib python-geopy python-tcxreader python-requests python-niaaml python-overpy python-gpxpy python-geotiler python-dotmap)
makedepends=(python-build python-install python-poetry-core)
checkdepends=(python-pytest)
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('d42b23f962eac5686cdb30610313e34697604a27e654eb7a294b6f24386660f88fdeb25f398a4e0684c84176c3260028419bc340f83c9db7ab5cd9379b0c2553')

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
