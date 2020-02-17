# This PKGBUILD is based off from libwebsockets package
# Original package maintainer: Jelle van der Waa <jelle@archlinux.org>
# Original package contributor: Jingbei Li <i@jingbei.li>
# Previous maintainer: Mark Vainomaa <mikroskeem@mikroskeem.eu>
# Maintainer: Elmar Klausmeier <Elmar.Klausmeier@gmail.com>

pkgname=libwebsockets-libuv
pkgver=3.2.2
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
source=("https://github.com/warmcat/libwebsockets/archive/v$pkgver.tar.gz")
sha256sums=('166d6e17cab64bfc10c2a71799c298284540a1fa63f6ea3de5caccb34502243c')

build() {
	cd "libwebsockets-${pkgver}"

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
	cd "libwebsockets-${pkgver}/build"
	make DESTDIR="${pkgdir}" install

	cd ..

	install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
	install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
}

