# Maintainer: Martí Comas <m4rti21@proton.me>
pkgname='book-git'
pkgver=r61.39d0d1d
pkgrel=2
pkgdesc='A simple bookmark manager written in go'
arch=('x86_64')
url="https://codeberg.org/Marti/book"
license=('GPL')
makedepends=('git' 'go')
source=("${pkgname}::git+https://codeberg.org/Marti/book.git")
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
    install -Dm755 "./book" "$pkgdir/usr/bin/book"
    install -Dm644 "./README.md" "$pkgdir/usr/share/doc/book"
}
