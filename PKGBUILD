# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=googlemaps
pkgver=20170802.6715783
pkgrel=1
pkgdesc='Google Maps plugin for QtLocation'
url='https://github.com/vladest/googlemaps'
license=('MIT')
arch=('i686' 'x86_64')
makedepends=('git' 'qt5-tools')
depends=('qt5-location')
source=('git+https://github.com/vladest/googlemaps')
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
	cd "${srcdir}/${pkgname}"
	install -d build
	cd build
	qmake ../googlemaps.pro
	make
}

package() {
	cd "${srcdir}/${pkgname}"
	cd build
	make INSTALL_ROOT="${pkgdir}" install
}
