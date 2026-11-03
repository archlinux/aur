# Maintainer: LeafEvans <leafevans@foxmail.com>
pkgname=go-fuck
pkgver=0.10.0
pkgrel=2
pkgdesc='A blazingly fast reimplementation of thefuck in Go'
arch=('x86_64' 'aarch64')
url='https://github.com/leafevans/go-fuck'
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('37afd512a04668490386deb6cfeb47e65884b45688b813af6a7342c62b7c8b55')

build() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=0
  go build -trimpath \
    -ldflags "-s -w -X github.com/leafevans/go-fuck/internal/consts.Version=$pkgver" \
    -o go-fuck ./cmd/go-fuck
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 go-fuck "$pkgdir/usr/bin/go-fuck"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
