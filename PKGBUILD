# Maintainer: Nick Boughton <nicholasboughton@gmail.com>
pkgname=yapa
pkgver=0.10.0
pkgrel=1
pkgdesc="Yet another podcast app. Terminal podcast app for listening to podcasts in date order."
arch=('x86_64')
url="https://github.com/nboughton/yapa"
license=('MIT')
depends=('mpv')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nboughton/yapa/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e9f3c3c192732c11797068f50456d2d6e1ab1693422f29c11cb679c2ddeef5a0')

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
