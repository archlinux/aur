# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=NiaAML-GUI
pkgname=python-${_base,,}
pkgver=0.3.0
pkgrel=1
pkgdesc="GUI for NiaAML Python package"
url="https://github.com/firefly-cpp/${_base}"
arch=(any)
license=(MIT)
depends=(python-niaaml python-qtawesome python-pyqt6)
makedepends=(python-build python-installer python-poetry-core)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('7a4fffcea349bdf67beae18eb7b404ba1062dd8cc3bd5a24f882fb683891b1099d2e1dc50cdadb1830cf584e40c16353ce80e450644c20e8c1e65f6b1e8e4e26')

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
