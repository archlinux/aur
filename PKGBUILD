# Maintainer: Luis Pérez <luis.perez@protonmail.com>
pkgname=doggo
pkgver=0.2.5
pkgrel=1
pkgdesc='Command-line DNS Client for Humans.'
arch=('x86_64')
url="https://github.com/mr-karan/doggo/archive/"
license=('GPL')
makedepends=('go')
source=("$url/v$pkgver.tar.gz")
conflicts=('doggo-git')
sha256sums=('aeb03ffb77602d812dbd6aa6ae83d2c22755bb548ece419748ffc1e2d1d53372')

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build/$pkgname ./cmd/...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
