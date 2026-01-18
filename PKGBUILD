# Maintainer: Darshit Shah <aur@contact.darnir.net>
#
pkgname=quadlet-lsp
pkgver=0.6.0
pkgrel=1
pkgdesc='Language Server Protocol for Podman Quadlets'
arch=('x86_64')
url="https://github.com/onlyati/quadlet-lsp"
license=('GPL')
makedepends=('go')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5fff1980616738df6c71fd265455234fc86edf8d30b9b0af8827c1721afa2a6d')

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -mod=vendor -o bin/quadlet-lsp
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 bin/$pkgname "$pkgdir"/usr/bin/$pkgname
}
