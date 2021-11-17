# Maintainer: fubarhouse
pkgname=pygmy-go
provides=(pygmy-go)
pkgver=0.8.0
pkgrel=5
pkgdesc="Amazee.io's local docker development tool"
arch=('x86_64')
url="https://github.com/fubarhouse/pygmy-go"
license=('MIT')
conflicts=('pygmy-go-git')
makedepends=('go-pie')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/fubarhouse/pygmy-go/archive/v${pkgver}.tar.gz")
sha512sums=('bfadd85356ad116de00d59af985011e3b68521dbf2fe314c3bf00db040beccfc26c50acdace36e689471a379ea5bc588db22cabcd02e32db38965f5a3d4793a8')

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
