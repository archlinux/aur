# Maintainer: Ikosse <andrelofgren@hotmail.co.uk>

pkgname=harbour-amazfish
pkgver=2.0.2
pkgrel=1
pkgdesc="Companion application for Huami Devices and the Pinetime Infinitime"
arch=('x86_64' 'aarch64')
url="https://github.com/piggz/harbour-amazfish"
provides=('harbour-amazfish')
conflicts=('harbour-amazfish' 'harbour-amazfish-git')
license=('AGPL3')
depends=(
	'qt5-base'
	'kdb'
	'kcontacts'
	'kcoreaddons'
	'qt5-location'
	'qt5-connectivity'
	'qtmpris'
	'nemo-qml-plugin-dbus'
)
source=("https://github.com/piggz/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('a6b196104da1833895957437651bdcab85ebef56a79fa839150e5c14abf5afca323082a0c3c773f2d2518dabb0ca4903ec3725f6186f1b2dd533b5c534310ef3')

prepare() {
	cd "$srcdir"/$pkgname-$pkgver
	rm -rf qble daemon/libwatchfish
	git init
	git submodule add https://github.com/piggz/qble.git qble
	git submodule add https://github.com/piggz/libwatchfish.git daemon/libwatchfish	
}

build () {
	cd "$srcdir"/$pkgname-$pkgver
	qmake FLAVOR=kirigami PREFIX=/usr .
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make INSTALL_ROOT="$pkgdir" install
}
