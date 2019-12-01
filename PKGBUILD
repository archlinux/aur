# Maintainer: Gokberk Yaltirakli <aur at gkbrk dot com>
pkgname=unbird
pkgver=r2.3234264
pkgrel=1
epoch=
pkgdesc="Extract code from Bird-style Literate Programming files"
arch=('x86_64')
url="https://github.com/gkbrk/unbird"
license=('GPL')
depends=()
makedepends=('gcc')
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname::git+$url")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"

    ( set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
    cd "$srcdir/$pkgname"
    # No patches needed for now
}

build() {
    cd "$srcdir/$pkgname"
    make clean
    make
}

check() {
    cd "$srcdir/$pkgname"
}

package() {
    cd "$srcdir/$pkgname"

    install -Dm755 "bin/unbird" "$pkgdir/usr/bin/unbird"
}
