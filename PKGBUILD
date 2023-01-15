# Maintainer: solsTiCe d'Hiver <solstice.dhiver@gmail.com>
pkgname=libwifi
pkgver=0.0.8
pkgrel=1
pkgdesc="An 802.11 Frame Parsing and Generation library written in C"
arch=('x86_64')
url="https://libwifi.so"
license=('APACHE')
makedepends=('cmake')
source=("libwifi-${pkgver}.tar.gz::https://github.com/libwifi/libwifi/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('f3eb9a0a63fa9f5253ff75c40563a9378f51bf04786161f79cce67f312dcb70c')

prepare() {
	cd "$pkgname-$pkgver"
	sed -i 's/\/usr\/local/${CMAKE_INSTALL_PREFIX}/g' CMakeLists.txt
}

build() {
	cd "$pkgname-$pkgver"
	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd "$pkgname-$pkgver/build"
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
