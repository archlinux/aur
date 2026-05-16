# Maintainer: Aaron Bockelie <aaronsb@gmail.com>
pkgname=mmaid
pkgver=0.5.0
pkgrel=1
pkgdesc="Terminal Mermaid diagram renderer - inline diagrams from Mermaid syntax in your terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/aaronsb/mmaid-go"
license=('MIT')
depends=()
makedepends=('go>=1.23')
source=("$pkgname-$pkgver.tar.gz::https://github.com/aaronsb/mmaid-go/archive/v$pkgver.tar.gz")
sha256sums=('2c33658cc7826a9686310153b80f46b82d4d55054b34e589007dd1c8dc1cdd1d')

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
