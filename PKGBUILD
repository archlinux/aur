# Maintainer: iamawacko <iamawacko@protonmail.com>

pkgname=entropy
pkgver=1.0.1
pkgrel=1
pkgdesc="CLI tool that will scan your codebase for high entropy lines, which are often secrets. "
makedepends=('go')
arch=('any')
url='https://github.com/EwenQuim/entropy'
license=('MIT')
source=(https://github.com/EwenQuim/entropy/archive/v$pkgver.tar.gz)
sha512sums=('50f7f69df9642416274b004d30fb4aad95f1f434a7f4ce769f840beec72eacd4b5b49ad85abf76d5806c3d9f3e1e2e249582a96c10e99ec596b916d624abc75a')

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
