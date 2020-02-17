# This PKGBUILD is based off from libwebsockets package
# Original package maintainer: Jelle van der Waa <jelle@archlinux.org>
# Original package contributor: Jingbei Li <i@jingbei.li>
# Previous maintainer: Mark Vainomaa <mikroskeem@mikroskeem.eu>
# Maintainer: Elmar Klausmeier <Elmar.Klausmeier@gmail.com>

pkgname=libwebsockets-libuv
pkgver=3.2
pkgrel=1
pkgdesc="C library for websocket clients and servers (compiled with libuv support)"
arch=('i686' 'x86_64' 'armv7h')
url="https://libwebsockets.org"
depends=('openssl' 'libuv')
makedepends=('cmake')
conflicts=('libwebsockets')
provides=('libwebsockets')
replaces=('libwebsockets')
license=('LGPL')
source=("https://libwebsockets.org/git/libwebsockets/snapshot/libwebsockets-v$pkgver-stable.tar.gz")
sha256sums=('3b10d3198b12b07108e38f11b88345715335ddc82e2c2d4980f5b8556ca97048')

build() {
	cd "libwebsockets-v${pkgver}-stable"

	mkdir build  &&  cd build
	cmake -DCMAKE_BUILD_TYPE=Release \
	      -DCMAKE_INSTALL_PREFIX:PATH=/usr \
	      -DLWS_WITH_STATIC=OFF \
	      -DLWS_LINK_TESTAPPS_DYNAMIC=ON \
	      -DLWS_UNIX_SOCK=ON \
	      -DLWS_IPV6=ON \
	      -DLWS_WITH_LIBUV=ON \
	      ..
	make
}

package() {
	cd "libwebsockets-v${pkgver}-stable/build"
	make DESTDIR="${pkgdir}" install

	cd ..

	install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
	install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
}

