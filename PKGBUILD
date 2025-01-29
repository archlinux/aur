# Maintainer: Martí Comas <m4rti21@proton.me>
pkgname='blks-git'
pkgver=r8.09582d6
pkgrel=1
pkgdesc='dwmblocks/slstatus-like program written in go'
arch=('x86_64')
url="https://codeberg.org/Marti/blks"
license=('GPL')
makedepends=('git' 'go')
source=("${pkgname}::git+https://codeberg.org/Marti/blks.git")
md5sums=('SKIP')
options=('!debug')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "$srcdir/$pkgname"
    go build
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 "./blks" "$pkgdir/usr/bin/blks"
    install -Dm644 "./README.md" "$pkgdir/usr/share/doc/blks"
}
