# Maintainer: revsuine <pid1 at revsuine dot xyz>

_pkgname=wayneko
pkgname=$_pkgname-git
pkgver=r29.c1919dc
pkgrel=3
pkgdesc="Display an animated neko cat on the bottom of a Wayland output."
arch=("x86_64")
url="https://git.sr.ht/~leon_plickat/$_pkgname"
license=('GPL-3.0-or-later')
depends=("wayland"
         "pixman")
makedepends=("git")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    cd "$srcdir/$_pkgname"
    # Makefile's prefix is /usr/local which seems less standard
    prefix="/usr"
    
    make DESTDIR="$pkgdir" PREFIX="$prefix" install
}
