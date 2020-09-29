# Maintainer: Mike Kazantsev <mk.fraggod@gmail.com>

pkgname=telegram-tdlib-purple-minimal-git
pkgver=r275.66f9c98
pkgrel=6
pkgdesc='libpurple Telegram plugin implemented using official tdlib client library, packaged for bitlbee, without voip and image-processing dependencies.'
arch=(any)
url='https://github.com/ars3niy/tdlib-purple'
license=(GPL2)
depends=(libpurple-minimal telegram-tdlib)
makedepends=(cmake git)
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
	cmake -DNoWebp=TRUE -DNoLottie=TRUE -DNoVoip=TRUE ..
	make
}

package() {
	cd $pkgname
	install -Dm755 -t "$pkgdir$(pkg-config --variable plugindir purple)" build/libtelegram-tdlib.so
}
