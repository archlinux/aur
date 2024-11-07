# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name=guidata
pkgname="python-${_name}"
pkgver=3.7.1
pkgrel=1
pkgdesc="Python library generating graphical user interfaces for easy dataset editing and display"
arch=("any")
url="https://github.com/PlotPyStack/${_name}"
license=("BSD-3-Clause")
depends=(python-qtpy python-pyqt5-datavisualization python-pyqt5-webengine python-h5py python-pandas python-matplotlib python-beautifulsoup4 python-sphinx python-setuptools python-pytest)
makedepends=(python-build python-installer python-wheel python-pydantic)
optdepends=('spyder: GUI-based test launcher, dict/array editor')
source=("$_name-$pkgver.tar.gz::https://github.com/PlotPyStack/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('04ce2db58ef34dddb0406202f96bffd4c1c716bd90b81791e74a523ade920af3')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
