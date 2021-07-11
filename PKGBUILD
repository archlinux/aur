# Maintainer: N.Boughton, <nicholasboughton@gmail.com>
pkgname=swnt
pkgver=0.8.2
pkgrel=1
pkgdesc="Command line GM tools for Stars Without Number"
arch=('x86_64')
url="https://github.com/nboughton/swnt"
license=("MIT")
optdepends=('hugo: export sectors as hugo sites')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nboughton/swnt/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c6f28f6822b699994aed9ac1309aa5c95ae3ca8e5cc6b87ce0fa06e0e390fce6')

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
