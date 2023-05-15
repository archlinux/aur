# Maintainer: éclairevoyant
# Contributor: Benoit Pierre <benoit dot pierre at gmail dot com>

pkgname=plover
pkgdesc="Free and open source real-time stenography engine"
pkgver=4.0.0.dev12
pkgrel=1
arch=(any)
url="https://www.openstenoproject.org/plover/"
license=(GPL2)
depends=(
	dbus
	python
	python-appdirs
	'python-plover_stroke>=1.1.0'
	python-pyqt5
	python-pyserial
	python-rtf_tokenize
	python-setuptools
	python-wcwidth
	python-xlib
	qt5-svg
)
makedepends=(
	python-babel
	python-build
	python-installer
	python-wheel
)
checkdepends=(
	python-mock
	python-pytest
	python-pytest-qt
	python-pytest-xvfb
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/openstenoproject/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('36b1bf4c30623e5ccb76fe3c2afbac43ba1407b1dcf1b654383c660aaf4f9d73d7ee9be2fae5616bd38f9746abc13bb2d8f66f553684fcf2b3fd91b489ee2503')

build() {
	cd $pkgname-$pkgver
	python -m build -wn
}

check() {
	cd $pkgname-$pkgver
	PYTEST_DISABLE_PLUGIN_AUTOLOAD=1 python -m pytest -p pytest-qt -p xvfb test
}

package() {
	cd $pkgname-$pkgver
	python -m installer -d "$pkgdir" dist/*.whl
	install -vDm644 plover/assets/$pkgname.png -t "$pkgdir/usr/share/pixmaps/"
	install -vDm644 linux/$pkgname.desktop -t "$pkgdir/usr/share/applications/"
}
