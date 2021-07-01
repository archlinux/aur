# Maintainer: yhtez <yhtez@protonmail.com>
pkgname=obs-websocket
pkgver=4.9.1
_obsver=27.0.0
pkgrel=1
pkgdesc='WebSockets API for obs-studio'
arch=('x86_64')
url="https://github.com/Palakis/$pkgname"
license=('GPL2')
depends=("obs-studio>=$_obsver")
makedepends=('asio' 'cmake' 'websocketpp')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('4024a33e6512a2edd659ab97fe3ca4c3e58922923a1ff2a99b2d58a275b93e13')

build() {
    cmake \
        -B "$pkgname-$pkgver/build" \
        -S "$pkgname-$pkgver" \
        -DLIBOBS_INCLUDE_DIR=/usr/include/obs \
        -DCMAKE_INSTALL_PREFIX=/usr
    make -C "$pkgname-$pkgver/build"
}

package() {
    make -C "$pkgname-$pkgver/build" DESTDIR="$pkgdir" install
}
