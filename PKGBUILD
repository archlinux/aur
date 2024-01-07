# Maintainer: Ikosse <andrelofgren@hotmail.co.uk>

pkgname=harbour-amazfish
pkgver=2.2.1
pkgrel=1
pkgdesc="Companion application for Huami Devices and the Pinetime Infinitime"
arch=('x86_64' 'aarch64')
url="https://github.com/piggz/harbour-amazfish"
provides=('amazfish')
license=('AGPL3')
depends=(
	'qt5-base'
	'karchive5'
	'kdb'
	'kcontacts5'
	'qt5-location'
	'qt5-connectivity'
	'qtmpris'
	'nemo-qml-plugin-dbus'
	'kirigami2'
	'bluez-qt5'
)
makedepends=('git')
source=("https://github.com/piggz/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('3934894764d7c76e7dafe866a60c7abaeb8ae96624fa4bc5d6cd3b5025bc0b3f7a72f442128eebb43871ec4e92b06ada3f94d287d81c03be2c0222c1fce828b5')

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
