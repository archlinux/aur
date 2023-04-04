pkgname=ixwebsocket
pkgver=11.4.3
pkgrel=1
pkgdesc="websocket and http client and server library, with TLS support and very few dependencies"
url="https://github.com/machinezone/IXWebSocket"
license=('BSD-3-Clause')
arch=('x86_64')
source=("https://github.com/machinezone/IXWebSocket/archive/refs/tags/v$pkgver.tar.gz" )
sha256sums=('aa2d02c9c71339943cc61eb4efeb2ffc3a5a0011128a67027b9251b7d8a6e0ac')
depends=('openssl')

prepare(){
       cd "IXWebSocket-$pkgver"
       cp ../../ixwebsocket.pc ./
}

build() {
        cd "IXWebSocket-$pkgver"
        mkdir -p build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX=/usr -DUSE_TLS=1 -DBUILD_SHARED_LIBS=ON ..
        make
}

package() {
        cd "IXWebSocket-$pkgver"
        install -D ixwebsocket.pc "$pkgdir/usr/lib/pkgconfig/ixwebsocket.pc"
        cd build
        make DESTDIR="$pkgdir/" install
}