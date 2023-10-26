# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name=guidata
pkgname="python-${_name}"
pkgver=3.1.1
pkgrel=1
pkgdesc="Python library generating graphical user interfaces for easy dataset editing and display"
arch=('any')
url="https://github.com/PlotPyStack/${_name}"
license=("custom:BSD-3-clause")
depends=(python-qtpy python-pyqt5-datavisualization python-pyqt5-webengine python-h5py python-pandas python-matplotlib python-beautifulsoup4 python-sphinx python-setuptools python-pytest)
makedepends=(python-build python-installer python-wheel python-pydantic)
optdepends=('spyder: GUI-based test launcher, dict/array editor')
source=("$_name-$pkgver.tar.gz::https://github.com/PlotPyStack/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f93ae44d6b8b7f30bd6463483b65632dd13f347af57ff49a3cecb198d9edd96e')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
