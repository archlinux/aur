# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=libcmb
pkgver=1.3.1
pkgrel=1
pkgdesc="combinatorics library"
url="https://fraubsd.org/libcmb"
arch=('x86_64')
license=('BSD')
makedepends=('awk')
depends=('openssl')
source=("git+https://github.com/FrauBSD/pkgcenter")
sha256sums=('SKIP')

pkgver() {
  cd pkgcenter/depend/libcmb
  awk 'match($$0, /\$Version: [^$]* \$/) {
         print substr($0, RSTART + 10, RLENGTH - 12);
         exit found=1;
       } END { exit !found }' cmb.c | cut -d' ' -f2
}

prepare() {
  cd pkgcenter/depend/libcmb
  ./configure --prefix "$pkgdir/usr"
}

build() {
  cd pkgcenter/depend/libcmb
  make
}

package() {
  cd pkgcenter/depend/libcmb
  make install
}
