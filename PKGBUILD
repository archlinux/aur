# Maintainer: iamawacko <iamawacko@protonmail.com>

pkgname=entropy
pkgver=1.0.2
pkgrel=1
pkgdesc="CLI tool that will scan your codebase for high entropy lines, which are often secrets. "
makedepends=('go')
arch=('any')
url='https://github.com/EwenQuim/entropy'
license=('MIT')
source=(https://github.com/EwenQuim/entropy/archive/v$pkgver.tar.gz)
sha512sums=('068402a43b3c9ef20dee9044bffe4ef695dbbf9a618f2aa223cb165b586714f1fcb416a6f3827c497656fbfcbeb537cf18d35b038363c1c2a056c2c0de5af7a3')

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-$pkgver"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
