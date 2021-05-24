# Maintainer: fubarhouse
pkgname=pygmy-go-git
conflicts=(pygmy-go-bin)
provides=(pygmy-go)
pkgver=main
pkgrel=1
pkgdesc="Amazee.io's local docker development tool"
arch=('x86_64')
url="https://github.com/fubarhouse/pygmy-go"
license=('MIT')
makedepends=(git go-pie)
source=(git://github.com/fubarhouse/pygmy-go.git)
sha512sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
  cd "$pkgname"
  go mod vendor
  go build \
    -mod=vendor \
    -trimpath \
    -ldflags "-extldflags ${LDFLAGS}" \
    .
}

package() {
  cd "$pkgname"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}