# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=alps-mail-git
_pkgname=alps
pkgver=r247.5fee600
pkgrel=1
license=('MIT')
pkgdesc="A simple Webmail in Go"
makedepends=('go')
arch=('x86_64')
url="https://git.sr.ht/~emersion/alps"
source=("$pkgname::git+https://git.sr.ht/~emersion/alps")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
   cd $pkgname
   export CGO_LDFLAGS="${LDFLAGS}"
   export CGO_CFLAGS="${CFLAGS}"
   export CGO_CPPFLAGS="${CPPFLAGS}"
   export CGO_CXXFLAGS="${CXXFLAGS}"
   export GOFLAGS="-buildmode=pie -trimpath -modcacherw"
   go build -o $_pkgname ./cmd/alps
}

package() {
  cd $pkgname
  install -Dm755 $_pkgname "${pkgdir}"/usr/bin/$_pkgname
}
