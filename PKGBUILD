# Maintainer: Mihai Bisog <mihai.bisog@gmail.com>
pkgname=xfstk-dldr
pkgver=1.8.1
pkgrel=1
pkgdesc="Update Intel SoC firmware over USB using the DNX protocol"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/xfstk/"
license=('LGPL')
depends=('qt4' 'libusb' 'boost')
makedepends=('doxygen' 'graphviz' 'cmake')
provides=('xfstk-dldr' 'xfstk-dldr-gui')
conflicts=('xfstk-dldr' 'xfstk-dldr-gui')
source=("http://sourceforge.net/projects/xfstk/files/$pkgname-linux-source-$pkgver.tar.gz")
md5sums=("c076b3bbbe9907ef2eb7958e17b152bd")

prepare() {
    cd "xfstk-build/linux-source-package"
    mkdir -p build
    cd build
    BUILD_VERSION=$pkgver cmake .. -DCMAKE_INSTALL_PREFIX:PATH=/usr
}

build() {
    cd "xfstk-build/linux-source-package/build"
    make
}

package() {
    cd "xfstk-build/linux-source-package/build"
    make DESTDIR="$pkgdir/" install
}
