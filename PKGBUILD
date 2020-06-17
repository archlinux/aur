# Maintainer: Whemoon Jang <palindrom615@gmail.com>
pkgname=sdkman-cli
pkgver=0.4.11
pkgrel=1
pkgdesc='Unofficial Client of sdkman, A Tool for managing parallel versions of multiple Software Development Kits'
arch=('x86_64')
url="https://github.com/palindrom615/$pkgname"
license=('Apache 2.0')
makedepends=('go')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('20947b8ccfbf7d3ea72ee39a36997b63f3a06c6ba70653ea40945e14eef8058a')

build() {
  cd $pkgname-$pkgver
  go build \
    -mod=mod \
    -trimpath \
    -ldflags="-X 'github.com/palindrom615/sdkman/cmd.version=$pkgver' -extldflags $LDFLAGS" \
    -o sdk .
}

check() {
  cd $pkgname-$pkgver
  go test -mod=mod ./...
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 sdk "$pkgdir"/usr/bin/sdk
}
