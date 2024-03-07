pkgname=ixwebsocket
pkgver=11.4.5
pkgrel=1
pkgdesc="websocket and http client and server library, with TLS support and very few dependencies"
url="https://github.com/machinezone/IXWebSocket"
license=('BSD-3-Clause')
arch=('x86_64' 'aarch64' 'armv7h' 'riscv64')
source=("https://github.com/machinezone/IXWebSocket/archive/refs/tags/v$pkgver.tar.gz" )
sha256sums=('c5fc225edec32bf7d583e55347ef2c9c4940d005c13ef5e848354a85602f5fd6')
makedepends=('cmake' 'make' 'gcc')
depends=('openssl')

prepare(){
       cd "IXWebSocket-$pkgver"
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
        cd build
        make DESTDIR="$pkgdir/" install
}
