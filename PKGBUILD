# Maintainer: Ikosse <andrelofgren@hotmail.co.uk>

pkgname=harbour-amazfish
pkgver=2.1.2
pkgrel=1
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
sha512sums=('9cff6dd41b4c8787720ed901b494dcdcd735164229e901d7ee158942931bdd56f47376a3bc9e6ec11c51627eb8af9010c600715f485986b2f19c1f7bc600fac8')

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
