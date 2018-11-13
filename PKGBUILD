# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=cmb
pkgbase=cmb
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
  ./configure --prefix /usr
}

build() {
  cd pkgcenter/depend/cmb
  make
}

package() {
  cd pkgcenter/depend/cmb

  # Disabled for now because DESTDIR isn't respected
  #DESTDIR="$pkgdir" make install

  install -dm755 "$pkgdir"/usr/bin
  install -m755 cmb "$pkgdir"/usr/bin/

  install -dm755 "$pkgdir"/usr/share/man/man1
  install -m444 cmb.1.gz "$pkgdir"/usr/share/man/man1/
}
