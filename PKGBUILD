# Maintainer: Nick Boughton <nicholasboughton@gmail.com>
pkgname=yapa
pkgver=0.8.0
pkgrel=1
pkgdesc="Yet another podcast app. Terminal podcast app for listening to podcasts in date order."
arch=('x86_64')
url="https://github.com/nboughton/yapa"
license=('MIT')
depends=('mpv')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nboughton/yapa/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1be69b6acdf62f890b4a870d97a3799f2271f93459ec58f4dd7ea7b80dc0802f')

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
