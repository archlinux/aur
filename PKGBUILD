# Maintainer: claymorwan <claymorwan@fembois.dev>
pkgname=wallpaperengine-gui
pkgver=1.2.0
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
sha256sums=('162d1538caf17aa961108b7ff181c59bb91245de7a98bdb28bcbc04f7e87b131')

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
