# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name=PythonQwt
pkgname=python-${_name,,}
pkgver=0.11.1
pkgrel=1
pkgdesc="Qt plotting widgets (pure Python reimplementation of Qwt C++ library)"
arch=('any')
url="https://github.com/PlotPyStack/${_name}"
license=('custom')
depends=(python-pyqt5 qt5-svg 'python-qtpy' 'python-numpy')
makedepends=(python-setuptools)
source=("$_name-$pkgver.tar.gz::https://github.com/PlotPyStack/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d2d4f89ac863cd86997c9755a6358f3c9e9185943c3a6883e3df05205c4fcd13')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
