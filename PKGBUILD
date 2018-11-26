# Maintainer: Petr Kutálek <petr@kutalek.cz>
pkgname=png2pos
pkgver=git
pkgdesc='A utility to converter PNG images to ESC/POS'
url='https://github.com/petrkutalek/png2pos'
license=('MIT')

pkgrel=0
epoch=
arch=('i686' 'x86_64' 'arm')
makedepends=('git')
source=(
    "$pkgname"::"git+https://github.com/petrkutalek/png2pos.git"
    )
sha256sums=(
    'SKIP'
    )

pkgver () {
    cd "$pkgname"
    printf '%s' "$(git tag -l -n1 | cut -f1 -d' ' | cut -c 2-)"
}

prepare () {
    cd "$pkgname"
    git submodule init
    git submodule update
}

build () {
    cd "$pkgname"
    make
}

package () {
    cd "$pkgname"
    make DESTDIR="$pkgdir/usr" install
}
