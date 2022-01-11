# Maintainer: Ben Aaron Goldberg <ben@benaaron.dev>
# Contributor: Alex <alex1701c.dev[at]gmx.net>
pkgname=plasma5-runners-emoji
pkgver=2.2.0
pkgrel=2
pkgdesc="Select emojis and copy/paste them"
arch=(x86_64)
url=https://github.com/alex1701c/EmojiRunner
license=(GPL3)
depends=(krunner xdotool kcmutils)
makedepends=(cmake extra-cmake-modules ki18n qt5-base qt5-tools)
source=("$pkgname-$pkgver.tar.gz::https://github.com/alex1701c/EmojiRunner/archive/$pkgver.tar.gz")
sha256sums=("4de1a0ecf0d16c8e640bb442d0d840247dc30c1816d25ceda5238ca0ab2a2c6d")

prepare(){
	cd  "EmojiRunner-$pkgver"
	mkdir -p build
}

build() {
	cd "EmojiRunner-$pkgver/build"
	cmake -DCMAKE_INSTALL_PREFIX=`kf5-config --prefix` \
		-DQT_PLUGIN_INSTALL_DIR=`kf5-config --qt-plugins` \
		-DCMAKE_BUILD_TYPE=Release ..
	make -j $(nproc)
}

package() {
	cd  "$srcdir/EmojiRunner-$pkgver/build"
	make install DESTDIR="${pkgdir}"
}
