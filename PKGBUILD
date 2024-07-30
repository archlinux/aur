# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=sport-activities-features
pkgname=python-${_base}
pkgdesc="Minimalistic toolbox for extracting features from sports activity files written in Python"
pkgver=0.4.2
pkgrel=1
arch=(any)
url="https://github.com/firefly-cpp/${_base}"
license=(MIT)
depends=(python-geopy python-overpy python-geotiler python-tcxreader
  python-niaaml python-tcx2gpx python-gpxpy)
makedepends=(python-build python-installer python-poetry-core)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('be8f64526bea04dc9122249e1626e0e2972980c5b37870df511f14c66edb806db60314e09458e706d79ce9f295f37bd37b2d43567e1860869d9fa7056efde526')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m pytest #-k 'not load_pipeline'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
