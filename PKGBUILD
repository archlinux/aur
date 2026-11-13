# Maintainer: LeafEvans <leafevans@foxmail.com>
pkgname=go-fuck
pkgver=2.24.0
pkgrel=1
pkgdesc='A blazingly fast reimplementation of thefuck in Go'
arch=('x86_64')
url='https://github.com/leafevans/go-fuck'
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('195831d3d64e731944069a9fffa8b219239b79ffbc2b0ed42f4dd33c6b549290')

build() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=0
  go build -trimpath \
    -ldflags "-s -w -X github.com/leafevans/go-fuck/v2/internal/consts.Version=$pkgver" \
    -o go-fuck ./cmd/go-fuck
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 go-fuck "$pkgdir/usr/bin/go-fuck"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
