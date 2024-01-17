# Maintainer: éclairevoyant
# Contributor: Benoit Pierre <benoit dot pierre at gmail dot com>

pkgname=plover
pkgdesc="Free and open source real-time stenography engine"
pkgver=4.0.0.rc2
_pkgver=4.0.0rc2
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
source=("$pkgname-$pkgver.tar.gz::https://github.com/openstenoproject/$pkgname/archive/refs/tags/v$_pkgver.tar.gz")
b2sums=('b83bf5bd831115e91da55ba8e4530d7ff0194ca5c02c46e0915da9dd3909b5bc4d112d9161a89cdb3268b28f005595479f1731dcfc381762a5553d41edb7bc05')

build() {
	cd $pkgname-$_pkgver
	python -m build -wn
}

check() {
	cd $pkgname-$_pkgver
	PYTEST_DISABLE_PLUGIN_AUTOLOAD=1 python -m pytest -p pytest-qt -p xvfb test
}

package() {
	cd $pkgname-$_pkgver
	python -m installer -d "$pkgdir" dist/*.whl
	install -vDm644 plover/assets/$pkgname.png -t "$pkgdir/usr/share/pixmaps/"
	install -vDm644 linux/$pkgname.desktop -t "$pkgdir/usr/share/applications/"
}
