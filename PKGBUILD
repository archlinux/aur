# Maintainer: Jan Cholasta <grubber at grubber cz>

pkgname=oblige
pkgver=7.70
pkgrel=2
epoch=1
pkgdesc='A random level maker for games based on the Doom engine'
arch=('i686' 'x86_64')
url='http://oblige.sourceforge.net/'
license=('GPL')
depends=('fltk>=1.3.0' 'hicolor-icon-theme')
makedepends=('xdg-utils')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver/./}-source.zip"
        '0001-Fix-compilation.patch')
sha256sums=('0d35050a5a3d10c932b44cfcb9d02777012d7ab0b3e2e2ed56bc5b388c068271'
            'e12ce68bbdb3801d35be924832174d446dbf7242aa192c5fc0ecc3bd28d76987')

prepare() {
    cd Oblige-${pkgver}-source

    patch -i "$srcdir"/0001-Fix-compilation.patch -p 1 --binary
}

build() {
    cd Oblige-${pkgver}-source

    make
}

package() {
    cd Oblige-${pkgver}-source

    mkdir -p "$pkgdir"/usr/bin
    mkdir -p "$pkgdir"/usr/share/applications
    mkdir -p "$pkgdir"/usr/share/desktop-directories
    mkdir -p "$pkgdir"/usr/share/icons/hicolor

    XDG_DATA_DIRS="$pkgdir"/usr/share make install PREFIX="$pkgdir"/usr

    rm -f "$pkgdir"/usr/share/applications/mimeinfo.cache
    rmdir "$pkgdir"/usr/share/desktop-directories
}
