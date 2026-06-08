# Maintainer: pyndys
pkgname=ggf
pkgver=0.2.1
pkgrel=1
pkgdesc="Great Go Fetch (ggf) - fast system info fetch utility for Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/pyndys/ggf"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pyndys/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('0d2691b69f17f0add359a409f5fccbd583046e3fd84cdc2eb86e4520a1b4c16fbfb16230268689fdbe4cb33816812a2716badd1385426654a37760e4388e2578')

build() {
    cd "$pkgname-$pkgver"
    export CGO_ENABLED=0
    go build -v \
        -ldflags="-s -w" \
        -o "$pkgname" \
        .
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
