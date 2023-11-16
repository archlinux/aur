# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=openant
pkgname=python-${_base,,}
pkgdesc="ANT, ANT-FS and ANT+ Python Library"
pkgver=1.3.0
pkgrel=1
arch=(any)
url="https://github.com/Tigge/${_base}"
license=(MIT)
depends=(python-pyusb)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('522e47417aa559470e46e330e333028da5b02f390b6335bb5d3b30ef4dd52e5a9aa090d20a7dacaa8ad8f438ba174e2e81084ab8a073e794abd4fcc1539273f2')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m pytest ${_base}/tests
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --prefix=/usr --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
