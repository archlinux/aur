# Maintainer: iamawacko <iamawacko@protonmail.com>

pkgname=entropy
pkgver=1.0.7
pkgrel=1
pkgdesc="CLI tool that will scan your codebase for high entropy lines, which are often secrets. "
makedepends=('go')
arch=('any')
url='https://github.com/EwenQuim/entropy'
license=('MIT')
source=(https://github.com/EwenQuim/entropy/archive/v$pkgver.tar.gz)
sha512sums=('2be398efdd0ddebd3e1159f0bd0a4fd8f561a3959aaf038e6fd0b8ad81b0683eda043e0e41944426d976464dd27936378461596576442eb8762d03a78386f8be')

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
