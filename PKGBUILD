# Maintainer: Maxim Devaev <mdevaev@gmail.com>


pkgname=libwebsockets-patched
pkgver=3.1.0
pkgrel=2
pkgdesc="C library for websocket clients and servers (with enabled AF_UNIX)"
url="https://libwebsockets.org"
license=(LGPL)
arch=(i686 x86_64 armv6h armv7h)
depends=(openssl)
provides=(libwebsockets)
conflicts=(libwebsockets)
replaces=(libwebsockets)
makedepends=(cmake)
source=("https://github.com/warmcat/libwebsockets/archive/v$pkgver.tar.gz")
sha256sums=(db948be74c78fc13f1f1a55e76707d7baae3a1c8f62b625f639e8f2736298324)


build() {
	cd "libwebsockets-$pkgver"
	mkdir build
	cd build
	cmake \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX:PATH=/usr \
		-DLWS_WITH_STATIC=OFF \
		-DLWS_LINK_TESTAPPS_DYNAMIC=ON \
		-DLWS_UNIX_SOCK=ON \
		..
	make
}

package() {
	cd "libwebsockets-$pkgver/build"
	make DESTDIR="$pkgdir" install
	cd ..
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
