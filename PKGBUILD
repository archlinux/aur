# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=koushin-git
_pkgname=koushin
pkgver=r104.d36ec52
pkgrel=1
license=('MIT')
pkgdesc="A simple Webmail in Go"
makedepends=('go-pie')
arch=('x86_64')
url="https://git.sr.ht/~emersion/koushin"
source=("$pkgname::git+https://git.sr.ht/~emersion/koushin")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
   cd $pkgname
   go build \
    -trimpath \
    -ldflags "-extldflags $LDFLAGS" \
    -o $_pkgname ./cmd/koushin
}

package() {
  cd $pkgname
  install -Dm755 $_pkgname "${pkgdir}"/usr/bin/$_pkgname
}
