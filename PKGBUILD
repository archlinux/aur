# Maintainer: Aaron Bockelie <aaronsb@gmail.com>
pkgname=mmaid

# The repository is not named after the package, so the tarball extracts to
# mmaid-go-$pkgver rather than mmaid-$pkgver. Naming it here keeps build() and
# the Makefile's dry run reading the same value instead of both hardcoding it.
_repo=mmaid-go
pkgver=0.6.0
pkgrel=1
pkgdesc="Terminal Mermaid diagram renderer - inline diagrams from Mermaid syntax in your terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/aaronsb/mmaid-go"
license=('MIT')
depends=()
makedepends=('go>=1.23')
source=("$pkgname-$pkgver.tar.gz::https://github.com/aaronsb/mmaid-go/archive/v$pkgver.tar.gz")
sha256sums=('7cbcfff9e84edb705f547a83f9eee570e9abb52c7c5cf80899b855e9d579e592')

build() {
    cd "$srcdir/$_repo-$pkgver"
    export CGO_ENABLED=0
    go build -trimpath -ldflags="-s -w" -o "$pkgname" ./cmd/mmaid
}

package() {
    cd "$srcdir/$_repo-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
