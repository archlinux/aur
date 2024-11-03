# Maintainer: fubarhouse
pkgname=pygmy
provides=(pygmy)
pkgver=0.13.1
pkgrel=1
pkgdesc="Amazee.io's local docker development tool"
arch=('x86_64')
url="https://github.com/pygmystack/pygmy"
license=('MIT')
conflicts=(pygmy-bin pygmy-git pygmy-go-bin pygmy-go-git)
makedepends=('go-pie')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pygmystack/pygmy/archive/v${pkgver}.tar.gz")
sha512sums=('c8b63a8cbe59d0dcdd92a028d0fb6fee134af4766fbf1276a97313ba005b1881bd284a42328f1ed53f98611c190c407a02628220adafcdd21064cf9b94a2505a')

build(){
  cd "$pkgname-$pkgver"
  go mod vendor
  go build \
    -mod=vendor \
    -trimpath \
    -buildvcs=false \
    .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
