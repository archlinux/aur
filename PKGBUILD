# Maintainer: iamawacko <iamawacko@protonmail.com>

pkgname=entropy
pkgver=1.0.6
pkgrel=1
pkgdesc="CLI tool that will scan your codebase for high entropy lines, which are often secrets. "
makedepends=('go')
arch=('any')
url='https://github.com/EwenQuim/entropy'
license=('MIT')
source=(https://github.com/EwenQuim/entropy/archive/v$pkgver.tar.gz)
sha512sums=('72920bc5f73e8248d4c4d65e4e5987c0595f65b46e333d7e99f3d98289f62172c7f9404e7e444dbd6557e70cef7dfeacafa155eb2c45fc226e6daec63d912db8')

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
