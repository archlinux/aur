# Maintainer: notliad <notliad@gmail.com>
pkgname=liftoff
pkgver=0.5.0
pkgrel=1
pkgdesc='Fast CLI project launcher — detect, install and start projects in one command'
arch=('x86_64' 'aarch64')
url='https://github.com/notliad/liftoff'
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/notliad/liftoff/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d2ea83194a20a02c6d43b51ee888f49209fe572a0554b10d6fcb3bd9aeea300f')

build() {
    cd "$pkgname-$pkgver"
    export CGO_ENABLED=0
    export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
    go build -ldflags "-s -w" -o "$srcdir/lo" ./cmd/lo
}

check() {
    cd "$pkgname-$pkgver"
    go test ./...
}

package() {
    install -Dm755 "$srcdir/lo" "$pkgdir/usr/bin/lo"
    install -Dm644 "$pkgname-$pkgver/man/man1/lo.1" "$pkgdir/usr/share/man/man1/lo.1"
    install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
