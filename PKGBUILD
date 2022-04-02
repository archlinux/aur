# Maintainer: Ikosse <andrelofgren@hotmail.co.uk>

pkgname=harbour-amazfish
pkgver=2.0.5
pkgrel=2
pkgdesc="Companion application for Huami Devices and the Pinetime Infinitime"
arch=('x86_64' 'aarch64')
url="https://github.com/piggz/harbour-amazfish"
provides=('amazfish')
license=('AGPL3')
depends=(
	'qt5-base'
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
sha512sums=('1cbaff9112c1afe7e52841050acc9f64da8e98f07f348d9e5d66a65e39d929ae7f703a6b3c89dcf74124ac4bc6c540757a9f3482935548c6385faf33514d5eb6')

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
