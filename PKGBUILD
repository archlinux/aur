pkgname=mupen64plus-qt
pkgver=1.17
pkgrel=2
pkgdesc="A customizable launcher for Mupen64Plus"
arch=('i686' 'x86_64')
url="https://github.com/dh4/mupen64plus-qt"
license=('BSD')
depends=('sdl2' 'quazip-qt6' 'mupen64plus' 'hicolor-icon-theme')
makedepends=('cmake')
install=mupen64plus-qt.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dh4/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('2da57d302265f8c0a2e705660e243c2a827a086cba2a6ed92fccdb1ea333f328')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    # Fix build with version 1.17/Qt 6.10
    sed -i s/FILENAME_VARIABLE/OUTPUT_SCRIPT/g CMakeLists.txt

    cmake .
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "mupen64plus-qt"                     "$pkgdir/usr/bin/mupen64plus-qt"
    install -Dm644 "LICENSE"                            "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "resources/mupen64plus-qt.desktop"   "$pkgdir/usr/share/applications/mupen64plus-qt.desktop"
    install -Dm644 "resources/images/mupen64plus.png"   "$pkgdir/usr/share/icons/hicolor/128x128/apps/mupen64plus-qt.png"
}
