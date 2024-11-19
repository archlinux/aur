# Maintainer: Eve Kolb <evekolb2204@gmail.com>
pkgname=grizzly
pkgver=0.6.1
pkgrel=1
pkgdesc="A utility for managing Jsonnet dashboards against the Grafana API"
arch=("x86_64")
url="https://github.com/grafana/grizzly"
license=("Apache-2.0")
source=("$pkgname-$arch-$pkgver.tar.gz::https://github.com/grafana/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
makedepends=("go")
sha256sums=('bd5ed75eb4d7cf96cf58e58f7f134c9a4e803bf2237a8a8a1b9bc99176fc147d')
conflicts=("grizzly-bin")
prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p build/
}

build(){
  cd "$pkgname-$pkgver"
  CGO_ENABLED=0 GOOS=linux go build -o build ./cmd/grr
  ls build
}

check() {
  cd "$pkgname-$pkgver"
  go test ./cmd/... ./pkg/...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/grr "$pkgdir"/usr/bin/grr
}

