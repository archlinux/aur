# Maintainer: Eve Kolb <evekolb2204@gmail.com>
pkgname=grizzly
pkgver=0.7.1
pkgrel=1
pkgdesc="A utility for managing Jsonnet dashboards against the Grafana API"
arch=("x86_64")
url="https://github.com/grafana/grizzly"
license=("Apache-2.0")
source=("$pkgname-$arch-$pkgver.tar.gz::https://github.com/grafana/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
makedepends=("go")
sha256sums=('81811b684ef1bddd3b7147c5095224552a0b35dc3ff210d10e6cbc5e12331160')
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

