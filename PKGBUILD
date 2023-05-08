# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=sport-activities-features
pkgname=python-${_base}
pkgdesc="Minimalistic toolbox for extracting features from sports activity files written in Python"
pkgver=0.3.12
pkgrel=1
arch=(any)
url="https://github.com/firefly-cpp/${_base}"
license=(MIT)
depends=(python-geopy python-requests python-overpy python-gpxpy python-geotiler python-dotmap python-tcxreader python-niaaml python-tcx2gpx)
makedepends=(python-build python-installer python-poetry-core)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('550572023177e731b5ff39ba3394c0fa9b557c247b6d0cb9db86daf14846320577249b83e24992f2ef94cd8fe6d89b58d69834c410606a6c3cfe1caf117c06d8')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m pytest -k 'not generated_object_altitudes and not generated_object_properties'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
