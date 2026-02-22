# Maintainer: Stevan <stevp003@gmail.com>
pkgname=ttune
pkgver=0.8.0
pkgrel=1
pkgdesc="Terminal based guitar tuner"
arch=('x86_64' 'aarch64')
url="https://github.com/SteveMCWin/ttune"
license=('MIT')
depends=()
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/SteveMCWin/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c4684e1f09d572fc13bb0fc98e4bd6d5502f10c8516504e3c6c597f710277921')

build() {
    cd "$pkgname-$pkgver"
    export CGO_ENABLED=0
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -ldflags="-s -w -X main.version=$pkgver" -o "$pkgname" .
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
