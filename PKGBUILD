# Maintainer: revsuine <paradoor at protonmail dot com>
_pkgname=wayneko
pkgname=$_pkgname-git
pkgver=r29.c1919dc
pkgrel=1
pkgdesc="Display an animated neko cat on the bottom of a Wayland output."
arch=("x86_64")
url="https://git.sr.ht/~leon_plickat/$_pkgname"
license=('GPL-3.0-or-later')
depends=("wayland")
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

    # note: the makefile puts the mandir and bashcompdir as /usr/local/share/...;
    # just /usr/share is a more standard location
    bashcompdir="/usr/share/bash-completions/completions"
    mkdir -p "$pkgdir$bashcompdir"
    make DESTDIR="$pkgdir" MANDIR="/usr/share/man" BASHCOMPDIR="$bashcompdir" install
}
