# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=tcx2gpx
pkgname=python-${_base}
pkgdesc="Converts the Garmin tcx GPS file format to the more commonly used gpx file format"
pkgver=0.1.4
pkgrel=1
arch=(any)
url="https://gitlab.com/nshephard/${_base}"
license=(GPL3)
depends=(python-gpxpy python-tcxparser python-tqdm)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest-cov)
source=(${url}/-/archive/0.1.4/${_base}-${pkgver}.tar.gz)
sha512sums=('3a3b57b3de998e05bd23a383d19a3ef1a4ed3fd9959cde44a5d97b6fab9058426d326502bc4ed0e14fdce74d61b3e5ea01acf2eb57b02a1d58dbad55f3b0cff6')

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
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
