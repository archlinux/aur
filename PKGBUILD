# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=NiaAML-GUI
pkgname=python-${_base,,}
pkgver=0.4.1
pkgrel=1
pkgdesc="GUI for NiaAML Python package"
url="https://github.com/firefly-cpp/${_base}"
arch=(any)
license=(MIT)
depends=(python-niaaml python-qtawesome python-pyqt6 python-pyqt-feedback-flow)
makedepends=(python-build python-installer python-poetry-core)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('8954f62e179b5455d5284a3dd8d00fc74ee73f9cd8a6550f8cfd3a537a0d65829f3e0a5a9e7d45305a9b30c3e0a41fbe5f3eb5dfcbfd8c48ee3a16141213df9c')

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
