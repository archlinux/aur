# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=tcx2gpx
pkgname=python-${_base}
pkgdesc="Converts the Garmin tcx GPS file format to the more commonly used gpx file format"
pkgver=0.1.5
pkgrel=1
arch=(any)
url="https://gitlab.com/nshephard/${_base}"
license=(GPL3)
depends=(python-gpxpy python-tcxparser python-tqdm)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest-cov)
source=(${url}/-/archive/${pkgver}/${_base}-${pkgver}.tar.gz)
sha512sums=('82632e6088aca2f7acd45361bd8d561f212d17b9773f2c893afa469d2d8a57ac920aad93f78d185b8f2f03bc523b6ac340f8b15597aff877439cad8d0b1a1842')

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
