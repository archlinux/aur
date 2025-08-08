# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=NiaAML-GUI
pkgname=python-${_base,,}
pkgver=0.4.3
pkgrel=1
pkgdesc="GUI for NiaAML Python package"
url="https://github.com/firefly-cpp/${_base}"
arch=(any)
license=(MIT)
depends=(python-niaaml python-qtawesome python-pyqt6 python-pyqt-feedback-flow)
makedepends=(python-build python-installer python-poetry-core)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('b4d4aa92237a0c73a3e50a93c7ad44ad0591e778588d9a99952229593a1389a5876d029a8505de94e71f5f8c90d7de57fb4a8b97fdded22d21f55425d4672407')

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
