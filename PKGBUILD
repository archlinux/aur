# Maintainer: Jan Cholasta <grubber at grubber cz>

pkgname=oblige
pkgver=7.70
pkgrel=1
epoch=1
pkgdesc='A random level maker for games based on the Doom engine'
arch=('i686' 'x86_64')
url='http://oblige.sourceforge.net/'
license=('GPL')
depends=('fltk>=1.3.0' 'hicolor-icon-theme')
makedepends=('xdg-utils')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver/./}-source.zip"
        '0001-Makefile-Makefile.macos-fixed-for-prefabs-directory-.patch'
        '0002-Makefile-fixed-make-install-not-installing-data-bg.patch')
sha256sums=('3a895c16dc352dab295ab1e3b7d62f55615bb21ff6d7d8c874787c0a62c64257'
            '53b98896e2385822c1bdc6ab1583696a54d2b7bc88f2cfb73ca4f0c156571af8'
            '08cd8906fbebb980976239f885c902df77ad9708361126389d470c35681dcf71')

prepare() {
    cd Oblige-${pkgver}-source

    patch -p 1 -i "$srcdir"/0001-Makefile-Makefile.macos-fixed-for-prefabs-directory-.patch
    patch -p 1 -i "$srcdir"/0002-Makefile-fixed-make-install-not-installing-data-bg.patch
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
