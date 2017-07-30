# Maintainer: Jan Cholasta <grubber at grubber cz>

pkgname=oblige
pkgver=7.666
pkgrel=1
pkgdesc='A random level maker for games based on the Doom engine'
arch=('i686' 'x86_64')
url='http://oblige.sourceforge.net/'
license=('GPL')
depends=('fltk>=1.3.0' 'hicolor-icon-theme')
makedepends=('xdg-utils')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver/./}-source.zip")
sha256sums=('21e056ad66115b47768871420bfb70e056b6a92877ec7eda72a04e69640307d6')

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
