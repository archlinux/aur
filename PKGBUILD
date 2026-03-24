# Maintainer: Aaron Bockelie <aaronsb@gmail.com>
pkgname=mmaid
pkgver=0.4.1
pkgrel=1
pkgdesc="Terminal Mermaid diagram renderer - inline diagrams from Mermaid syntax in your terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/aaronsb/mmaid-go"
license=('MIT')
depends=()
makedepends=('go>=1.23')
source=("$pkgname-$pkgver.tar.gz::https://github.com/aaronsb/mmaid-go/archive/v$pkgver.tar.gz")
sha256sums=('c5deafad7c3c8a06c538a4969151d2267859f04671fec874615accbb4b44503c')

build() {
    cd "$srcdir/mmaid-go-$pkgver"
    export CGO_ENABLED=0
    go build -trimpath -ldflags="-s -w" -o "$pkgname" ./cmd/mmaid
}

package() {
    cd "$srcdir/mmaid-go-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
