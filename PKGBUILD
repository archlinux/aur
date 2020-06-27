# Maintainer: Mike Kazantsev <mk.fraggod@gmail.com>

pkgname=telegram-tdlib-purple-git
pkgver=r275.66f9c98
pkgrel=2
pkgdesc='libpurple/pidgin Telegram plugin implemented using official tdlib client library.'
arch=(any)
url='https://github.com/ars3niy/tdlib-purple'
license=(GPL2 LGPL2.1)
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
	install -Dm755 -t "$pkgdir$(pkg-config --variable plugindir purple)" build/libtelegram-tdlib.so
	install -D -m644 -t "$pkgdir/usr/share/licenses/$pkgname" rlottie/licenses/*
}
