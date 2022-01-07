# Maintainer: fubarhouse
pkgname=pygmy
provides=(pygmy)
pkgver=0.8.0
pkgrel=1
pkgdesc="Amazee.io's local docker development tool"
arch=('x86_64')
url="https://github.com/pygmystack/pygmy"
license=('MIT')
conflicts=(pygmy-bin pygmy-git pygmy-go-bin pygmy-go-git)
makedepends=('go-pie')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pygmystack/pygmy/archive/v${pkgver}.tar.gz")
sha512sums=('0eef378c5b7829a73680a682f26dbb45b49e7d2d552f5f2e525ed2ef952dcc7a85f2815097928d10f00b98161ca1301a84ef7ddc9d52649fa8b09348451a1871')

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
  install -Dm755 $pkgname-go "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
