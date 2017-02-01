# Maintainer: Mark Vainomaa <mikroskeem@mikroskeem.eu>

# This PKGBUILD is based off from libwebsockets package
# Original package maintainer: Jelle van der Waa <jelle@archlinux.org>
# Original package contributor: Jingbei Li <i@jingbei.li>

_lws=libwebsockets
pkgname=${_lws}-libuv
pkgver=2.1.0
pkgrel=1
pkgdesc="C library for websocket clients and servers (compiled with libuv support)"
arch=('i686' 'x86_64')
url="https://libwebsockets.org"
depends=('openssl' 'libuv')
makedepends=('cmake')
conflicts=('libwebsockets')
provides=('libwebsockets')
replaces=('libwebsockets')
license=('LGPL')
source=("https://github.com/warmcat/libwebsockets/archive/v$pkgver.tar.gz")
md5sums=('4df3be57dee43aeebd54a3ed56568f50')

build() {
    cd "${_lws}-${pkgver}/"

    mkdir build && cd build
    cmake -D CMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX:PATH=/usr -DLWS_WITH_LIBUV=ON ..
    make
}

package() {
    cd "${_lws}-${pkgver}/build"
    make DESTDIR="${pkgdir}" install

    cd ..

    install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
}
