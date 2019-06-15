# Maintainer: Galen Abell <galen at galenabell dot com>

pkgname=bmk-git
_pkgname=bmk
pkgver=r24.92382c1
pkgrel=1
pkgdesc='A command-line bookmark manager'
arch=('x86_64')
url='https://git.sr.ht/~gjabell/bmk'
license=('AGPL3')
makedepends=('go')
provides=('bmk')
conflicts=('bmk')
source=("$_pkgname::git+https://git.sr.ht/~gjabell/bmk")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"

    ( set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "$srcdir/$_pkgname"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/$_pkgname"
    make PREFIX=/usr DESTDIR=$pkgdir install
}
