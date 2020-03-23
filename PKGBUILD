# Maintainer: Whemoon Jang <palindrom615@gmail.com>
pkgname=sdkman
pkgver=0.4.10
pkgrel=1
pkgdesc='A Tool for managing parallel versions of multiple Software Development Kits'
arch=('x86_64')
url="https://github.com/palindrom615/$pkgname"
license=('Apache 2.0')
makedepends=('go-pie')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('257f954663ee1ec5ff66942ac640918a4bf9f127c39c24da367f7b3cba652f2b')

build() {
  cd $pkgname-$pkgver
  go build \
    -mod=mod \
    -trimpath \
    -ldflags "-extldflags $LDFLAGS" \
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
