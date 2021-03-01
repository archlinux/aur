# Maintainer: Ben Aaron Goldberg <ben@benaaron.dev>
# Contributor: Alex <alex1701c.dev[at]gmx.net>
pkgname=plasma5-runners-emoji
pkgver=1.1.3
pkgrel=1
pkgdesc="Select emojis and copy/paste them"
arch=("any") 
url=https://github.com/alex1701c/EmojiRunner
license=(GLP3)
depends=(krunner xdotool)
makedepends=(cmake extra-cmake-modules ki18n qt5-base qt5-tools)
source=("$pkgname-$pkgver.tar.gz::https://github.com/alex1701c/EmojiRunner/archive/1.1.3.tar.gz")
sha256sums=("2600dde322a4f7f646245d92820ff91317ed35e1e64d263eb0f4784398933fb2")

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
