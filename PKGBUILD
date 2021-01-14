# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=cryfa
pkgver=20.04
pkgrel=1
pkgdesc="A secure encryption tool for genomic data"
arch=('i686' 'x86_64')
url="https://github.com/cobilab/cryfa"
license=('GPL')
depends=('gcc-libs')
makedepends=('git' 'cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cobilab/cryfa/archive/v$pkgver.tar.gz")
sha256sums=('8e65537821d4a6f8d64ddbdb7751344fcb7793096809cb3ed1661720c607aaa9')


build() {
  cd "cryfa-$pkgver"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  make -C "_build"
}

package() {
  cd "cryfa-$pkgver"

  install -Dm755 "_build/cryfa" -t "$pkgdir/usr/bin"
  install -Dm755 "_build/keygen" "$pkgdir/usr/bin/cryfa-keygen"
}
