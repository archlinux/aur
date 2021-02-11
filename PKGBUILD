# Maintainer: yhtez <yhtez@protonmail.com>
pkgname=obs-websocket
pkgver=4.9.0
_obsver=26.1.0
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
sha256sums=('b28d0153c1c67cbb3683dae2369de7daee4ce3c3666daec79327770e2153d573'
            'c015d9bab1075ecf9c66c066328e291a20ef36880958fb3db6486ebc5ca9c6da')

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
