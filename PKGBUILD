# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name=guidata
pkgname=python-$_name
pkgver=3.1.0
pkgrel=1
pkgdesc="Python library generating graphical user interfaces for easy dataset editing and display"
arch=('any')
url="https://github.com/PlotPyStack/${_name}"
license=('custom:BSD-3-clause')
depends=(python-qtpy python-pyqt5-datavisualization python-pyqt5-webengine python-h5py python-pandas python-matplotlib python-beautifulsoup4 python-sphinx)
makedepends=(python-build python-installer python-wheel)
optdepends=('spyder: GUI-based test launcher, dict/array editor')
source=("$_name-$pkgver.tar.gz::https://github.com/PlotPyStack/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('99aafa290274bccd3f2a0cd67ecf27cb7492fb336fa24ee22339f9a23141e301')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
