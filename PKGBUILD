# Maintainer: yhtez <yhtez@protonmail.com>
pkgname=obs-websocket
pkgver=4.9.0
_obsver=26.1.0
pkgrel=2
pkgdesc="WebSockets API for obs-studio"
arch=('x86_64')
url="https://github.com/Palakis/$pkgname"
license=('GPL2')
depends=("obs-studio>=$_obsver")
makedepends=('asio' 'cmake' 'websocketpp')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('b28d0153c1c67cbb3683dae2369de7daee4ce3c3666daec79327770e2153d573')

prepare() {
    rm -rf build
    mkdir build
}

build() {
    cd build
    cmake ../$pkgname-$pkgver \
        -DLIBOBS_INCLUDE_DIR=/usr/include/obs \
        -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd build
    DESTDIR="$pkgdir" make install
}
