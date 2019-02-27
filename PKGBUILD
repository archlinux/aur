# Maintainer: Jan Cholasta <grubber at grubber cz>

pkgname=oblige-git
pkgver=7.70+11+gb4fbd90
pkgrel=1
epoch=1
pkgdesc='A random level maker for games based on the Doom engine (git version)'
arch=('i686' 'x86_64')
url='http://oblige.sourceforge.net/'
license=('GPL')
depends=('fltk>=1.3.0' 'hicolor-icon-theme')
makedepends=('git' 'xdg-utils')
provides=('oblige')
conflicts=('oblige')
source=('Oblige::git+https://github.com/caligari87/Oblige.git')
sha256sums=('SKIP')

pkgver() {
    cd Oblige

    echo "7.70+$(git rev-list --count d1baa94..HEAD)+g$(git rev-parse --short=7 HEAD)"
}

build() {
    cd Oblige

    make
}

package() {
    cd Oblige

    mkdir -p "$pkgdir"/usr/bin
    mkdir -p "$pkgdir"/usr/share/applications
    mkdir -p "$pkgdir"/usr/share/desktop-directories
    mkdir -p "$pkgdir"/usr/share/icons/hicolor

    XDG_DATA_DIRS="$pkgdir"/usr/share make install PREFIX="$pkgdir"/usr

    rm -f "$pkgdir"/usr/share/applications/mimeinfo.cache
    rmdir "$pkgdir"/usr/share/desktop-directories
}
