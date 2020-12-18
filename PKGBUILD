# Maintainer: Luis Pérez <luis.perez@protonmail.com>
pkgname=doggo
pkgver=0.1.0
pkgrel=2
pkgdesc='Command-line DNS Client for Humans.'
arch=('x86_64')
url="https://github.com/mr-karan/doggo/archive/"
license=('GPL')
makedepends=('go')
source=("$url/v$pkgver.tar.gz")
conflicts=('doggo-git')
sha256sums=('7edcb5b6d85c09607e003dfaf9fb82dd6d40d400c845c06272f3090cb1ffa494')

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
