# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=cmb
pkgver=1.4.1
pkgrel=1
pkgdesc="combinatorics utility"
url="https://fraubsd.org/cmb"
arch=('x86_64')
license=('BSD')
makedepends=('libcmb' 'awk')
depends=('openssl' 'libcmb')
source=("git+https://github.com/FrauBSD/pkgcenter")
sha256sums=('SKIP')

pkgver() {
  cd pkgcenter/depend/cmb
  awk 'match($$0, /\$Version: [^$]* \$/) {
         print substr($0, RSTART + 10, RLENGTH - 12);
         exit found=1;
       } END { exit !found }' cmb.c
}

prepare() {
  cd pkgcenter/depend/cmb
  ./configure --prefix "$pkgdir/usr"
}

build() {
  cd pkgcenter/depend/cmb
  make
}

package() {
  cd pkgcenter/depend/cmb
  make install
}
