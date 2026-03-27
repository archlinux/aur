# Maintainer: Roniel Lopez <roniel.rack@gmail.com>
pkgname=rondo
pkgver=0.6.1
pkgrel=1
pkgdesc='A modern terminal productivity app combining task management with a daily journal'
arch=('x86_64')
url='https://github.com/roniel-rhack/rondo'
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('83b74c89b4a1326087faab52abb04793e9d59baabc107b1fd1c0342fff78b3bd')

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
