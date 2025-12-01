# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name=guidata
pkgname="python-${_name}"
pkgver=3.13.3
pkgrel=1
pkgdesc="guidata: Automatic GUI generation for easy dataset editing and display with Python"
arch=("any")
url="https://github.com/PlotPyStack/${_name}"
license=("BSD-3-Clause")
depends=(python python-h5py python-numpy python-qtpy python-requests python-tomli python-pandas python-beautifulsoup4 python-pillow python-matplotlib)
makedepends=(python-build python-installer python-wheel python-pydantic)
optdepends=(
  "spyder: GUI-based test launcher, dict/array editor"
  "python-sphinx: for building documentation"
  "python-pytest: for running tests"
)
source=("$_name-$pkgver.tar.gz::https://github.com/PlotPyStack/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("6edffa88ac175bf5923f6636e872b61553cec33de2e19ab7c6ab40108826f99d")

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
