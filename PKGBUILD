# Maintainer: Clayton Kehoe <clayton.j.kehoe at boeing dot com>
# Contributor : wiz64 <wiz64 dot com>
pkgname=config-file-validator
pkgver=1.7.1
pkgrel=1
pkgdesc="A tool to validate the syntax of configuration files"
arch=('x86_64')
url="https://github.com/Boeing/config-file-validator"
license=('Apache 2.0')
depends=('glibc')
makedepends=('go>=1.21')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  CGO_ENABLED=0 \
  GOOS=linux \
  GOARCH=amd64 \
  go build \
  -ldflags="-w -s -extldflags '-static' \
  -X github.com/Boeing/config-file-validator.version=$pkgver" \
  -tags netgo \
  -o validator \
  cmd/validator/validator.go
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 validator "$pkgdir/usr/bin/validator"
}
