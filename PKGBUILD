# Maintainer: claymorwan <claymorwan@fembois.dev>
pkgname=wallpaperengine-gui
pkgver=1.1.8
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
sha256sums=('51421ee950a470003f00afa89e057d089b52f6d2cf5392ab41cd99c923584f4d')

build() {
	cd "$pkgname-$pkgver"
	mkdir build && cd build
	cmake ..
	make -j$(nproc)
}

package() {
	cd "${pkgname}-${pkgver}/build"
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
	make DESTDIR="$pkgdir/" install
}
sha256sums=('5de19415b0c9e242e92ae9d71fad1331a00d3861c4c5d128f1b884e58e65889f')
