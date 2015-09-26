pkgname=mupen64plus-qt
pkgver=1.8
pkgrel=2
pkgdesc="A basic launcher for Mupen64Plus"
arch=('i686' 'x86_64')
url="https://github.com/dh4/mupen64plus-qt"
license=('BSD')
depends=('qt5-base' 'quazip-qt5' 'mupen64plus')
install=mupen64plus-qt.install
source=(https://github.com/dh4/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('d68b80a03c7ee5622d8e94066b338805500614b9424961020487454fd14b89ef')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    sed -i 's#include <quazip/#include <quazip5/#g' src/common.h

    qmake-qt5
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "mupen64plus-qt"                     "$pkgdir/usr/bin/mupen64plus-qt"
    install -Dm644 "LICENSE"                            "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "resources/mupen64plus-qt.desktop"   "$pkgdir/usr/share/applications/mupen64plus-qt.desktop"
    install -Dm644 "resources/images/mupen64plus.png"   "$pkgdir/usr/share/icons/hicolor/128x128/apps/mupen64plus-qt.png"
}
