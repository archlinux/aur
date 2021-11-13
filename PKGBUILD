# Maintainer: henning mueller <mail@nning.io>

pkgname=protonutils
pkgver=1.2.1
pkgrel=1
pkgdesc="CLI tool that provides different utilities to make using the Proton compatibility tool more easily"
arch=("x86_64")
url="https://github.com/nning/protonutils"
license=("MIT")
makedepends=(go make)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4e05fe556541d22c5f61dacc5344d5732fb9bc80866be38c1c0d572a6e6a6c2e')

prepare() {
  cd $pkgname-$pkgver
  printf "#!/bin/sh\necho $pkgver" > build/version.sh
}

build() {
  cd $pkgname-$pkgver
  make clean build
  ./cmd/protonutils/protonutils -m man1
}

package() {
  cd $pkgname-$pkgver
  install -Dm0755 cmd/$pkgname/$pkgname -t $pkgdir/usr/bin/
  install -Dm0755 man1/* -t $pkgdir/usr/share/man/man1/
}
