# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=sport-activities-features
pkgname=python-${_base}
pkgdesc="Minimalistic toolbox for extracting features from sports activity files written in Python"
pkgver=0.3.2
pkgrel=1
arch=(any)
url="https://github.com/firefly-cpp/${_base}"
license=(MIT)
depends=(python-matplotlib python-geopy python-tcxreader python-requests python-niaaml python-overpy python-gpxpy python-geotiler python-dotmap)
makedepends=(python-build python-install python-poetry-core)
checkdepends=(python-pytest)
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('cd92df81df72030039cab30619efd932e4b91a973f89c9d1c3cb0160a41107986b406614b178c1a82a679bc8d712759c541466d9e1fbdd98f37d79f4d359b615')

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
