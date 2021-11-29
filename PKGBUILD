# Maintainer: Ikosse <andrelofgren@hotmail.co.uk>

pkgname=harbour-amazfish
pkgver=2.0.3
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
sha512sums=('b1eec968a61fb19f94e9b37aaa83da7d1da4cb407dcbb676454c7da42c50c5e8976f5704106970ddd51ea3376f59ca1e41604e508a42c2ece460b41bbb36f5b7')

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
