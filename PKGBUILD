# Maintainer: Roniel Lopez <roniel.rack@gmail.com>
pkgname=rondo
pkgver=0.4.1
pkgrel=1
pkgdesc='A modern terminal productivity app combining task management with a daily journal'
arch=('x86_64')
url='https://github.com/roniel-rhack/rondo'
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('11cd3523f5b149fe0ccaccc14d6f8f7ccb9f2db679f2f1f6e71e7e7aecd5cdca')

build() {
    cd "$pkgname-$pkgver"
    export CGO_ENABLED=0
    export GOFLAGS='-buildmode=pie -trimpath'
    go build -ldflags "-s -w" -o "$pkgname" ./cmd/todo
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
