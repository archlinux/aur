# Maintainer: kyngs
pkgname=xfstk-dldr
pkgver=1.8.6
pkgrel=3
pkgdesc="Update Intel SoC firmware over USB using the DNX protocol"
arch=('i686' 'x86_64')
url="https://github.com/edison-fw/xFSTK"
license=('LGPL')
depends=('qt4' 'libusb-compat' 'boost')
makedepends=('doxygen' 'graphviz' 'cmake')
provides=('xfstk-dldr' 'xfstk-dldr-gui')
conflicts=('xfstk-dldr' 'xfstk-dldr-gui')
source=("git+${url}#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
    cd "xFSTK"
    mkdir -p build
    cd build
    BUILD_VERSION=$pkgver cmake .. -DCMAKE_INSTALL_PREFIX:PATH=/usr
}

build() {
    cd "xFSTK/build"
    make
}

package() {
    cd "xFSTK/build"
    make DESTDIR="$pkgdir/" install
}
