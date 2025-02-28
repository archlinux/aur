# Maintainer: Jisu-Woniu <jswn@jswn9945.xyz>
pkgname=protobuf-language-server
pkgver=0.1.1
pkgrel=1
pkgdesc='A language server implementation for Google Protocol Buffers'
arch=('x86_64')
url="https://github.com/lasorda/$pkgname"
license=('Apache-2.0')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('b73e45fdd2420003928099413896c1ad196422771226e95158b9a301e6c24fb111c88a0335f2f19bf4284f87b68bceb607f39ab95a990d4f19b6f77257bb7f35')

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
  go build -o build ./...
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
