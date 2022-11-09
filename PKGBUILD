# Maintainer: Ikosse <andrelofgren@hotmail.co.uk>

pkgname=harbour-amazfish
pkgver=2.1.0
pkgrel=4
pkgdesc="Companion application for Huami Devices and the Pinetime Infinitime"
arch=('x86_64' 'aarch64')
url="https://github.com/piggz/harbour-amazfish"
provides=('amazfish')
license=('AGPL3')
depends=(
	'qt5-base'
	'karchive'
	'kdb'
	'kcontacts'
	'qt5-location'
	'qt5-connectivity'
	'qtmpris'
	'nemo-qml-plugin-dbus'
	'kirigami2'
)
makedepends=('git')
source=("https://github.com/piggz/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('16df8f7592f02a00bb995de5004ccddba8f8bcd479bdf75cff813d41752b13122c7c5decaa7287543722a5cb938e11c891552b1da171a42bc16e7fa464239f31')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	rm -rf qble daemon/libwatchfish
	git init
	git submodule add https://github.com/piggz/qble.git qble
	git submodule add https://github.com/piggz/libwatchfish.git daemon/libwatchfish	
}

build () {
	cd "$srcdir/$pkgname-$pkgver"
	qmake FLAVOR=kirigami PREFIX=/usr .
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make INSTALL_ROOT="$pkgdir" install
}
