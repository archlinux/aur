# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=NiaAML-GUI
pkgname=python-${_base,,}
pkgver=0.4.2
pkgrel=1
pkgdesc="GUI for NiaAML Python package"
url="https://github.com/firefly-cpp/${_base}"
arch=(any)
license=(MIT)
depends=(python-niaaml python-qtawesome python-pyqt6 python-pyqt-feedback-flow)
makedepends=(python-build python-installer python-poetry-core)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('b96ac1ad88a22fc0bda3614e9c705f41c0397290b1094c14e684c11ee83d857b8b80199627293e52c90d86df233828cdf99a0f82c1f4e8bda216cf4256cb401c')

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
