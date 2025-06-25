# Maintainer: revsuine <pid1 at revsuine dot xyz>

_pkgname=wayneko
pkgname=$_pkgname-git
pkgver=r29.c1919dc
pkgrel=4
pkgdesc="Display an animated neko cat on the bottom of a Wayland output."
arch=("x86_64")
url="https://git.sr.ht/~leon_plickat/$_pkgname"
license=('GPL-3.0-or-later')
depends=("wayland"
         "pixman")
makedepends=("git")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url"
        "gnu17.patch")
sha256sums=('SKIP'
            '12fef9d20912efc1e8fe00b77187315b9741be67bf5bdfba951a4e7409c51b63')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "$srcdir/$_pkgname"
    patch -Np1 -i ../../gnu17.patch
}

package() {
    cd "$srcdir/$_pkgname"
    # Makefile's prefix is /usr/local which is for manually installed software
    # only; /usr is for packaged software
    prefix="/usr"
    
    make DESTDIR="$pkgdir" PREFIX="$prefix" install
}

