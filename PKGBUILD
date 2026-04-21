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
sha256sums=('afe415c72cf69b80facb0eb2ec3daf6bdb0eb2ca40bac36ac0c5ac540063f7e0')

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
