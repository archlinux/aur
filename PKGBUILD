# Maintainer: yhtez <yhtez@protonmail.com>
pkgname=obs-websocket
pkgver=4.8.0
_obsver=25.0.8
pkgrel=1
pkgdesc="WebSockets API for obs-studio"
arch=('x86_64')
url="https://github.com/Palakis/$pkgname"
license=('GPL2')
depends=("obs-studio>=$_obsver")
makedepends=('asio' 'cmake' 'websocketpp')
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
    "obs-studio-$_obsver.tar.gz::https://github.com/obsproject/obs-studio/archive/$_obsver.tar.gz"
)
sha256sums=('a0b99f8039225305af36ef84d353155173d5878f56187a8988a827b487f15781'
            'ef1179c23256c312212e3dce9083d4fa67751db05c3001ad824e2b6995943941')

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
