pkgname=go-mangadesk
_pkgname=mangadesk
pkgver=0.5.7
pkgrel=1
pkgdesc='Terminal client for MangaDex'
arch=('x86_64')
url="https://github.com/darylhjd/mangadesk"
license=('MIT')
makedepends=('go')
source=("git+$url#tag=v$pkgver?signed")
sha256sums=('SKIP')
validpgpkeys=('SKIP')

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
  go get -d ./...
  go build 
}

package() {
  cd "$pkgname"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
