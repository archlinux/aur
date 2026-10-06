# Maintainer: Aaron Bockelie <aaronsb@gmail.com>
pkgname=mmaid

# The repository is not named after the package, so the tarball extracts to
# mmaid-go-$pkgver rather than mmaid-$pkgver. Naming it here keeps build() and
# the Makefile's dry run reading the same value instead of both hardcoding it.
_repo=mmaid-go
pkgver=0.6.1
pkgrel=1
pkgdesc="Terminal Mermaid diagram renderer - inline diagrams from Mermaid syntax in your terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/aaronsb/mmaid-go"
license=('MIT')
depends=()
makedepends=('go>=1.23')
source=("$pkgname-$pkgver.tar.gz::https://github.com/aaronsb/mmaid-go/archive/v$pkgver.tar.gz")
sha256sums=('a220feac64062521eca290ef56bfe49b11918d82d3787ee643ea48dc3d9ec46e')

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
