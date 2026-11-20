# Maintainer: LeafEvans <leafevans@foxmail.com>
pkgname=go-fuck
pkgver=2.31.15
pkgrel=1
pkgdesc='A blazingly fast reimplementation of thefuck in Go'
arch=('x86_64')
url='https://github.com/leafevans/go-fuck'
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('890b1b0a1572aa5276f5ea2fa9d5bd408a27a8b70bf381d2b4459070c5e89315')

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
