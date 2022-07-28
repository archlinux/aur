# Maintainer: Ben Aaron Goldberg <ben@benaaron.dev>
# Contributor: Alex <alex1701c.dev[at]gmx.net>
pkgname=plasma5-runners-emoji
pkgver=2.3.0
pkgrel=1
pkgdesc="Select emojis and copy/paste them"
arch=(x86_64)
url=https://github.com/alex1701c/EmojiRunner
license=(GPL3)
depends=(krunner xdotool kcmutils)
makedepends=(cmake extra-cmake-modules ki18n qt5-base qt5-tools kdelibs4support)
source=("$pkgname-$pkgver.tar.gz::https://github.com/alex1701c/EmojiRunner/archive/$pkgver.tar.gz")
sha256sums=('bfbd82800162aac7d4aad6540122ce519d9505bbc145cd04399c00b826fdafe2')

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
