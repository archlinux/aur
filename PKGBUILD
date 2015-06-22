pkgname="shift-shift"
pkgver=7.25aca6e
pkgrel=1
pkgdesc="Simple Xorg keyboard switcher for my needs. Lshift for group1. Rshift for group2."
url="https://github.com/grafov/shift-shift"
arch=('any')
license=('GPL')
makedepends=('go')

source=(
    "git://github.com/grafov/shift-shift.git"
)

md5sums=(
    'SKIP'
)

pkgver() {
    cd "$pkgname"
    echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
    cd "$srcdir/$pkgname"

    rm -rf "$srcdir/.go/src"

    mkdir -p "$srcdir/.go/src"

    export GOPATH=$srcdir/.go

    mv "$srcdir/$pkgname" "$srcdir/.go/src/"

    cd "$srcdir/.go/src/$pkgname/"
    ln -sf "$srcdir/.go/src/$pkgname/" "$srcdir/$pkgname"

    go get
}

package() {
    mkdir -p "$pkgdir/usr/bin"
    cp "$srcdir/.go/bin/$pkgname" "$pkgdir/usr/bin"
}
