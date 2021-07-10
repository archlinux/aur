# Maintainer: Nick Boughton <nicholasboughton@gmail.com>
pkgname=yapa
pkgver=0.9.0
pkgrel=1
pkgdesc="Yet another podcast app. Terminal podcast app for listening to podcasts in date order."
arch=('x86_64')
url="https://github.com/nboughton/yapa"
license=('MIT')
depends=('mpv')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nboughton/yapa/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fc077f0e0822b491517856acd9377585d60285ccc2ac69190593ee54f265d24d')

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
  go build -v -o build 
}

#check() {
#  cd "$pkgname-$pkgver"
#  go test ./...
#}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
