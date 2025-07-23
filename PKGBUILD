# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=NiaAML-GUI
pkgname=python-${_base,,}
pkgver=0.4.0
pkgrel=1
pkgdesc="GUI for NiaAML Python package"
url="https://github.com/firefly-cpp/${_base}"
arch=(any)
license=(MIT)
depends=(python-niaaml python-qtawesome python-pyqt6)
makedepends=(python-build python-installer python-poetry-core)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('2d9a7dac73a9b905886fa9a7921b6ddca2297a65160ce2513bb6b0218fe881bf978c32bab2ba017e4f48df4cf031b941d1cc50693d2cf6a49e6d358a432d8a0c')

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
