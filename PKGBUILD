# Maintainer: fubarhouse
pkgname=pygmy-go
provides=(pygmy-go)
pkgver=0.7.0
pkgrel=3
pkgdesc="Amazee.io's local docker development tool"
arch=('x86_64')
url="https://github.com/fubarhouse/pygmy-go"
license=('MIT')
makedepends=('go-pie')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/fubarhouse/pygmy-go/archive/v${pkgver}.tar.gz")
sha512sums=('711e8544a9ee8a1fdd06042b35098536cc33afe70b6115a7e5c4736676d7348a560d3584c2af49267ff105b343c01072545471fa45f9c18e2ca49a7b6f246bd9')

build(){
  cd "$pkgname-$pkgver"
  go mod vendor
  go build \
    -mod=vendor \
    -trimpath \
    -ldflags "-extldflags ${LDFLAGS}" \
    .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
