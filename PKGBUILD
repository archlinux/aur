# Maintainer: Chinmay Dalal <w5vwg64uy@relay.firefox.com>
pkgname=gotktrix-git
license=('AGPL3')
pkgver=r334.f46ae83
pkgrel=2
pkgdesc="Matrix client in Go and GTK4"
arch=('x86_64')
url="https://github.com/diamondburned/${pkgname%-git}"
makedepends=("go")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=($pkgname::"git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    export GOPATH="$srcdir/go"
    cd "$srcdir/$pkgname"

    go build \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -o "${pkgname%-git}" .
}


package() {
    cd "$srcdir/$pkgname"
    export GOPATH="$srcdir/go"
    echo $PWD
    install -Dm755 "$srcdir/$pkgname/${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
}
