# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=cmb
pkgver=3.9.5
pkgrel=1
pkgdesc="combinatorics utility"
url="https://fraubsd.org/cmb"
arch=('x86_64')
license=('BSD')
makedepends=('awk' 'libcmb')
depends=('openssl' 'libcmb')
source=("git+https://github.com/FrauBSD/pkgcenter")
sha256sums=('SKIP')

pkgver() {
  cd pkgcenter/depend/cmb
  awk 'match($$0, /\$Version: [^$]* \$/) {
         print substr($0, RSTART + 10, RLENGTH - 12);
         exit found=1;
       } END { exit !found }' cmb.c |
  sed s/-/./g
}

build() {
  cd pkgcenter/depend/cmb
  ./configure --prefix "$pkgdir/usr"
  make || msg2 "Try upgrading libcmb and building cmb again afterwards"
}

package() {
  cd pkgcenter/depend/cmb
  make install
}
