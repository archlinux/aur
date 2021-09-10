# Maintainer: Amaan Hashmi-Ubhi <amaanhub at protonmail dot com>

pkgname=mangadesk
pkgver=0.5.7
pkgrel=2
pkgdesc='Terminal client for MangaDex'
arch=('x86_64')
url="https://github.com/darylhjd/mangadesk"
license=('MIT')
makedepends=('go')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('c5916fb33dcaf4898d95f4b1d8dbeaf8e4c99c28c11a2775368af683a2fac5f3b9277a42100fe0318b0477c97dc99735f3b6a70bc779c133f58d444f61ba968b')
validpgpkeys=('SKIP')

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
  go get -d ./...
  go build -o build ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
