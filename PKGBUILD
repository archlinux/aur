# Maintainer: mirdukkkkk <me@mrdk.uk>

pkgname=beefetch
pkgver=2.0.0
pkgrel=1
pkgdesc="Neofetch clone written in Go with the ability to display 🐝"
arch=('x86_64' 'aarch64')
url="https://github.com/mirdukkkkk/beefetch"
license=('GPL-3.0-only')

makedepends=('go')
options=('!debug')

source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('4b0753949ffd5f3eda9f5d0145633ff89c0e405bbfc90761a46d01a14900e6034c9694dcc8c73a2a261780ec6e0817684a0909a0be3febfe4337ec4878e74bcc')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    export CGO_ENABLED=0
    export GOFLAGS="-trimpath -buildmode=pie"

    go build -ldflags="-s -w" -o beefetch ./cmd/beefetch
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 beefetch "$pkgdir/usr/bin/beefetch"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
