# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name=guidata
pkgname="python-${_name}"
pkgver=3.4.0
pkgrel=1
pkgdesc="Python library generating graphical user interfaces for easy dataset editing and display"
arch=("any")
url="https://github.com/PlotPyStack/${_name}"
license=("custom:BSD-3-clause")
depends=(python-qtpy python-pyqt5-datavisualization python-pyqt5-webengine python-h5py python-pandas python-matplotlib python-beautifulsoup4 python-sphinx python-setuptools python-pytest)
makedepends=(python-build python-installer python-wheel python-pydantic)
optdepends=('spyder: GUI-based test launcher, dict/array editor')
source=("$_name-$pkgver.tar.gz::https://github.com/PlotPyStack/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("cef7cbd093d5a2a6bf391e485e5ef9b058bbd49e1629a234694d34bb2d52128b")

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

