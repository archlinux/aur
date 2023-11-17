# shellcheck shell=bash
# Maintainer: Chinmay Dalal <w5vwg64uy@relay.firefox.com>
pkgname=pyonji-git
pkgver=r75.d50435d
pkgrel=2
pkgdesc=" An easy-to-use tool to send e-mail patches "
arch=('x86_64')
url="https://sr.ht/~emersion/${pkgname%-git}"
makedepends=("go")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=($pkgname::"git+https://git.sr.ht/~emersion/${pkgname%-git}")
sha256sums=('SKIP')
license=('GPL3')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    export GOPATH="$srcdir/go"
    cd "${srcdir}/${pkgname}"

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
    install -Dm755 "$srcdir/$pkgname/${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
}
