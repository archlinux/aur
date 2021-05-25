# Maintainer: fubarhouse
pkgname=pygmy-go-git
cleanname=pygmy-go
conflicts=(pygmy-go-bin)
provides=(pygmy-go)
pkgver=main
pkgrel=2
pkgdesc="Amazee.io's local docker development tool"
arch=('x86_64')
url="https://github.com/fubarhouse/pygmy-go"
license=('MIT')
makedepends=(git go-pie)
source=(git://github.com/fubarhouse/pygmy-go.git)
sha512sums=('SKIP')

pkgver() {
  cd "$cleanname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
  cd "$cleanname"
  go mod vendor
  go build \
    -mod=vendor \
    -trimpath \
    -ldflags "-extldflags ${LDFLAGS}" \
    .
}

package() {
  cd "$cleanname"
  install -Dm755 "$cleanname" "$pkgdir/usr/bin/$cleanname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$cleanname/LICENSE"
}
