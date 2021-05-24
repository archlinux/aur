# Maintainer: fubarhouse
pkgname=pygmy-go
provides=(pygmy-go)
pkgver=0.6.0
pkgrel=3
pkgdesc="Amazee.io's local docker development tool"
arch=('x86_64')
url="https://github.com/fubarhouse/pygmy-go"
license=('MIT')
makedepends=('go-pie')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/fubarhouse/pygmy-go/archive/v${pkgver}.tar.gz")
sha512sums=('9a5737ca906910613233d6fded42643d83dd819b30db221aaaacca10875048c455bcc079874746bb9054baafa9f85ab93f9b636e2f2f90e45d8012ca99e2cac1')

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
