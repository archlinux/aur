# Maintainer: solsTiCe d'Hiver <solstice.dhiver@gmail.com>
pkgname=libwifi
pkgver=0.0.10
pkgrel=2
pkgdesc="An 802.11 Frame Parsing and Generation library written in C"
arch=('x86_64')
url="https://libwifi.so"
license=('Apache-2.0')
makedepends=('cmake')
source=("libwifi-${pkgver}.tar.gz::https://github.com/libwifi/libwifi/archive/refs/tags/${pkgver}.tar.gz" epoch.patch libwifi_remove_tag.patch)

sha256sums=('894a8ab711c0abdabd78cc55343757d35ddf4399e5243a9ed0a3a52659eb8f71'
            'be22e64d8456123a9077e4f5e3a7950b47330381e1a2970a2f4c58c5ec24e1a9'
            '44906e475bdf55173ab38e48edf5b403daf4b21e3cea8a78d12a0db5cf341838')
prepare() {
	cd "$pkgname-$pkgver"
	#sed -i 's/\/usr\/local/${CMAKE_INSTALL_PREFIX}/g' CMakeLists.txt
	#patch -i $srcdir/epoch.patch -p0
	#patch -i $srcdir/libwifi_remove_tag.patch -p0
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
