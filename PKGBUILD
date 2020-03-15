# Maintainer: yhtez <yhtez@protonmail.com>
pkgname=obs-websocket
pkgver=4.7.0
_obsver=24.0.3
pkgrel=2
pkgdesc="WebSockets API for obs-studio"
arch=('x86_64')
url="https://github.com/Palakis/$pkgname"
license=('GPL2')
depends=("obs-studio>=$obsver" 'openssl')
makedepends=('asio' 'cmake' 'websocketpp-git-dev')
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
    "obs-studio-$_obsver.tar.gz::https://github.com/obsproject/obs-studio/archive/$_obsver.tar.gz"
)
sha256sums=('1aa7eb296f9a82207353400d48b7cbdc3414ae6d37a085b0b35660577a09bafb'
            '19f59b5a58e2158a93fe425e236c2d535afcbfd6b1d4c881cd1d8023a7e3c474')

prepare() {
    rm -rf build
    mkdir build
}

build() {
    cd build
    cmake ../$pkgname-$pkgver \
        -DLIBOBS_INCLUDE_DIR=../obs-studio-$_obsver/libobs \
        -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd build
    DESTDIR="$pkgdir" make install
}
