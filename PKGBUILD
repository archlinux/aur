pkgname=ixwebsocket
pkgver=11.4.3
pkgrel=5
pkgdesc="websocket and http client and server library, with TLS support and very few dependencies"
url="https://github.com/machinezone/IXWebSocket"
license=('BSD-3-Clause')
arch=('x86_64' 'aarch64' 'armv7h' 'riscv64')
source=("https://github.com/machinezone/IXWebSocket/archive/refs/tags/v$pkgver.tar.gz" )
sha256sums=('aa2d02c9c71339943cc61eb4efeb2ffc3a5a0011128a67027b9251b7d8a6e0ac')
makedepends=('cmake' 'make' 'clang')
depends=('openssl')

prepare(){
       cd "IXWebSocket-$pkgver"
       patch --forward --strip=1 --input="../../pkgconfig.patch"
}

build() {
        cd "IXWebSocket-$pkgver"
        mkdir -p build
        cd build
        export CXX=clang++
        cmake -DCMAKE_INSTALL_PREFIX=/usr -DUSE_TLS=1 -DBUILD_SHARED_LIBS=ON ..
        make
}

package() {
        cd "IXWebSocket-$pkgver"
        cd build
        make DESTDIR="$pkgdir/" install
}
