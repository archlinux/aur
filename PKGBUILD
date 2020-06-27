# Maintainer: Mike Kazantsev <mk.fraggod@gmail.com>

pkgname=telegram-tdlib-purple-git
pkgver=r275.66f9c98
pkgrel=1
pkgdesc='libpurple/pidgin Telegram plugin implemented using official tdlib client library.'
arch=(any)
url='https://github.com/ars3niy/tdlib-purple'
license=(GPL2)
depends=(libpurple libpng libwebp telegram-tdlib)
makedepends=(git)
source=($pkgname::git+"$url")
sha256sums=(SKIP)

pkgver() {
	cd $pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $pkgname
	mkdir -p build
	cd build
	cmake ..
	make
}

package() {
	cd $pkgname
	destdir="$pkgdir$(pkg-config --variable plugindir purple)"
	install -Dm755 -t "$destdir"  build/libtelegram-tdlib.so
}
