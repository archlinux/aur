# Maintainer: Chinmay Dalal <w5vwg64uy@relay.firefox.com>
pkgname=river-levee-git
pkgver=r23.7c8a37d
pkgrel=1
pkgdesc="Statusbar for the river wayland compositor"
arch=('x86_64')
url="https://sr.ht/~andreafeletto/levee/"
makedepends=("zig")
source=($pkgname::"git+https://git.sr.ht/~andreafeletto/levee")
sha256sums=('SKIP')
license=('MIT')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname"
    git submodule update --init --recursive
    zig build -Drelease-safe
}


package() {
    cd "$srcdir/$pkgname"
    install -Dm755 "$srcdir/$pkgname/zig-out/bin/levee" "$pkgdir/usr/bin/levee"
}
