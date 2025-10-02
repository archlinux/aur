# Maintainer: claymorwan <claymorwan@fembois.dev>
pkgname=wallpaperengine-gui
pkgver=1.1.5
pkgrel=1
pkgdesc="GUI for linux-wallpaperengine"
arch=(x86_64)
url="https://github.com/MikiDevLog/wallpaperengine-gui"
license=('MIT')
depends=(linux-wallpaperengine qt6-base qt6-webengine qt6-multimedia)
makedepends=(base-devel cmake)
provides=($pkgname)
conflicts=($pkgname)
replaces=($pkgname)
source=("$pkgname-$pkgver.tar.gz"::${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('20b17b7641d3e468c9f6e5d276e7a493f8e6c0427b22f1ac8d0c2b8cab9754cf')

build() {
	cd "$pkgname-$pkgver"
	mkdir build && cd build
	cmake ..
	make -j$(nproc)
}

package() {
	cd "$pkgname-$pkgver"
	cd build
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
	make DESTDIR="$pkgdir/" install
}
