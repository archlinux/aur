# Maintainer: Amaan Hashmi-Ubhi <amaanhub at protonmail dot com>

pkgname=mangadesk
pkgver=0.6.2
pkgrel=1
pkgdesc='Terminal client for MangaDex'
arch=('x86_64')
url="https://github.com/darylhjd/mangadesk"
license=('MIT')
# according to namcap, this is needed
depends=('glibc')
makedepends=('go')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('4d6e39c86b4a055ad99d2d847525ee04f520e15ac157573f942c64ecbcf5cd633fc32cd17294c6431ea411e083a488d8a5b6cf856682eb545d52d3bb9be8ac78')
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
