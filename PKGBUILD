# Maintainer: iamawacko <iamawacko@protonmail.com>

pkgname=entropy
pkgver=1.0.3
pkgrel=1
pkgdesc="CLI tool that will scan your codebase for high entropy lines, which are often secrets. "
makedepends=('go')
arch=('any')
url='https://github.com/EwenQuim/entropy'
license=('MIT')
source=(https://github.com/EwenQuim/entropy/archive/v$pkgver.tar.gz)
sha512sums=('0a35bca73a57d217708dd503615e9b24de45bb0eb3b09ef5d60c9890391459bb822adad794b66a355e26ad33d3adfe7be96d6e8b08db751b29e94cd3ad7ca00d')

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
