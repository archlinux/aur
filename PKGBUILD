# Maintainer: claymorwan <claymorwan@fembois.dev>
pkgname=wallpaperengine-gui-git
_pkgname=${pkgname%-git}
pkgver=r32.3032b22
pkgrel=1
pkgdesc="GUI for linux-wallpaperengine"
arch=(x86_64)
url="https://github.com/MikiDevLog/wallpaperengine-gui"
license=('MIT')
depends=(linux-wallpaperengine qt6-base qt6-webengine qt6-multimedia)
makedepends=(base-devel cmake)
provides=($_pkgname)
conflicts=($_pkgname)
replaces=($_pkgname)
source=("$_pkgname-$pkgver::git+${url}")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname-$pkgver"
# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

build() {
	cd "$_pkgname-$pkgver"
	mkdir build && cd build
	cmake ..
	make -j$(nproc)
}

package() {
	cd "$_pkgname-$pkgver"
	cd build
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
	make DESTDIR="$pkgdir/" install
}
