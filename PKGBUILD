# Maintainer: Roniel Lopez <roniel.rack@gmail.com>
pkgname=rondo
pkgver=0.2.0
pkgrel=1
pkgdesc='A modern terminal productivity app combining task management with a daily journal'
arch=('x86_64')
url='https://github.com/roniel-rhack/rondo'
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4be2c1e401e1d433c66ed5d4d37b4efbde07a526870d938ea49cef1de6886b0d')

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
