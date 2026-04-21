# Maintainer: notliad <notliad@gmail.com>
pkgname=liftoff
pkgver=0.4.1
pkgrel=1
pkgdesc='Fast CLI project launcher — detect, install and start projects in one command'
arch=('x86_64' 'aarch64')
url='https://github.com/notliad/liftoff'
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/notliad/liftoff/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8b79583eabb1a58461f7ec9c85e5f70c2ffb92bc0290e5565610f76b603452e0')

build() {
    cd "$pkgname-$pkgver"
    export CGO_ENABLED=0
    export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
    go build -ldflags "-s -w" -o lo ./cmd/lo
}

check() {
    cd "$pkgname-$pkgver"
    go test ./...
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 lo "$pkgdir/usr/bin/lo"
    install -Dm644 man/man1/lo.1 "$pkgdir/usr/share/man/man1/lo.1"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
