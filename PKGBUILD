# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name=PythonQwt
pkgname=python-${_name,,}
pkgver=0.11.2
pkgrel=1
pkgdesc="Qt plotting widgets (pure Python reimplementation of Qwt C++ library)"
arch=('any')
url="https://github.com/PlotPyStack/${_name}"
license=('custom')
depends=(python-pyqt5 qt5-svg 'python-qtpy' 'python-numpy')
makedepends=(python-setuptools)
source=("$_name-$pkgver.tar.gz::https://github.com/PlotPyStack/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4d9f69b697e438ceda6132f4a34fe7aac997adf0f8abfcb44b26f05db4c68980')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
