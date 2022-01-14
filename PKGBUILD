# Maintainer: mochaaP <aur@mochaa.ws>

pkgname=relaygram
pkgver=0.2.0
pkgrel=1
pkgdesc='NekoX compatible WebSocket relay'
arch=($CARCH)
url="https://github.com/traidento/$pkgname"
license=('GPL')
makedepends=('go')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('f1b2de65a3f86fa3ece02d9dc40e59bc3ca25411cd6b2e082d081d24e34fcb73')

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

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
