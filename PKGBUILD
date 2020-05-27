pkgname=aqemu
pkgver=0.9.4
pkgrel=2
pkgdesc="QEMU GUI written in Qt5"
arch=('i686' 'x86_64')
url="https://github.com/tobimensch/aqemu"
license=('GPL2')
depends=('qemu' 'qt5-base' 'libvncserver')
makedepends=('cmake' 'qt5-base')
source=("aqemu-$pkgver.tar.gz::https://github.com/TBK/aqemu/archive/v${pkgver}.tar.gz")
# temporarily switched to https://github.com/TBK/aqemu as advised by upstream
#"aqemu-$pkgver.tar.gz::https://github.com/tobimensch/aqemu/archive/v${pkgver}.tar.gz")
md5sums=('06cb2349a78bb54fe1382f8ebf5b0e62')

prepare() {
    # explicit import needed for gcc10
    sed -i 's|#include <vector>|#include <vector>\n#include <stdexcept>|' "$srcdir"/$pkgname-$pkgver/src/docopt/docopt_value.h
}

build() {

    cd "$srcdir/$pkgname-$pkgver"
    cmake -DCMAKE_INSTALL_PREFIX=/usr/ -DQT_QMAKE_EXECUTABLE=qmake4
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
