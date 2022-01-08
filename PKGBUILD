# Maintainer: fubarhouse
pkgname=pygmy-git
cleanname=pygmy
provides=(pygmy)
pkgver=v0.7.1.r14.g93af147
pkgrel=1
pkgdesc="Amazee.io's local docker development tool"
arch=('x86_64')
url="https://github.com/pygmystack/pygmy"
license=('MIT')
conflicts=(pygmy pygmy-bin pygmy-go pygmy-go-bin pygmy-go-git)
makedepends=(git go-pie)
source=(git://github.com/pygmystack/pygmy.git)
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
