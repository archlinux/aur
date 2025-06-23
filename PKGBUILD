# Maintainer: Thomas Craggs <tom.craggs@protonmail.com>
pkgname=tidytask
pkgver=1.0.1
pkgrel=1
pkgdesc="A simple CLI tool for managing your to-do list"
arch=('x86_64')
url="https://github.com/tm-craggs/tidytask"
license=('GPLv3')
makedepends=('sqlite' 'go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tm-craggs/tidytask/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1d557bea7d4a71ddf9c004217acffee800bede4bdfc137829d96bc32ed46bd96')


build() {
    cd "$srcdir/$pkgname-$pkgver"

    export CGO_ENABLED=1
    export GO111MODULE=on

    go build -ldflags="-s -w" -o tidytask .
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 tidytask "$pkgdir/usr/bin/tidytask"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
