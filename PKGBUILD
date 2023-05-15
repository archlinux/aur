# Maintainer: Viktor Chuchman <norz3nmusic@gmail.com>
# Project by koki-develop (https://github.com/koki-develop/)
pkgname=gat
pkgver=0.8.2
pkgrel=1
pkgdesc='Cat alternative written in Go.'
arch=('x86_64')
url="https://github.com/koki-develop/gat"
license=('MIT')
makedepends=('go')
source=("$pkgname::git+https://github.com/koki-develop/gat.git#tag=v${pkgver}")
sha256sums=('SKIP')
provides=('gat')
conflicts=('gat' 'gat-git' 'gat-bin')

prepare(){
  cd "$pkgname"
  mkdir -p build/
}

build() {
  cd "$pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build
}

check() {
  cd "$pkgname"
  go test ./...
}

package() {
  cd "$pkgname"
  install -Dm755 "$srcdir"/"$pkgname"/build/gat "$pkgdir"/usr/bin/gat
}
