pkgname=lexicon
pkgver=0.1.0
pkgrel=1
pkgdesc='Simple terminal AI chat for quick lookups (not an agent harness)'
arch=('x86_64' 'aarch64')
url='https://github.com/kristyancarvalho/lexicon'
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f672056fdec22f2bc0aaf4dcc069c330981f2ce2b10c22622974f6a7ac0cece7')

build() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=0
  go build -trimpath -mod=readonly \
    -ldflags "-s -w -X main.version=$pkgver" \
    -o "$pkgname" ./cmd/lexicon
}

check() {
  cd "$pkgname-$pkgver"
  CGO_ENABLED=0 go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
