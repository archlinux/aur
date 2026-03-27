# Maintainer: Roniel Lopez <roniel.rack@gmail.com>
pkgname=rondo
pkgver=0.7.0
pkgrel=1
pkgdesc='A modern terminal productivity app combining task management with a daily journal'
arch=('x86_64')
url='https://github.com/roniel-rhack/rondo'
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('325065ed8326ba0ab22f1629152af5538a5d5ae92cc2d7786a4482e02af07c4f')

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
