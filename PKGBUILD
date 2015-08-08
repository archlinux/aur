# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gmp-mpbsd
# 5.0.5 was the last version to have mpbsd
pkgver=5.0.5
pkgrel=1
pkgdesc="BSD multi-precision arithmetic compatibility libraries from GMP"
arch=('i686' 'x86_64')
url="http://gmplib.org/"
depends=('gcc-libs' 'sh')
provides=('bsd-mp')
license=('LGPL3')
options=(!libtool)
source=(ftp://ftp.gmplib.org/pub/gmp-$pkgver/gmp-$pkgver.tar.xz{,.sig})
sha256sums=('e87015a825a2445e169931ee27849d52576a2d9e338d1383dcb36fed68d0006f'
            'SKIP')
validpgpkeys=('73D46C3667461E4BD93972495D6D47DFDB899F46')

build() {
  cd "gmp-$pkgver"
  if [[ $CARCH == i686 ]]; then
    export ABI=32
  fi
  ./configure --build=$CHOST --prefix=/usr --enable-mpbsd
  make
}

check() {
  cd "gmp-$pkgver"
  make check
}

package() {
  cd "gmp-$pkgver"
  make DESTDIR="${pkgdir}" install
  rm -rf "$pkgdir/usr/include/gmp.h" \
         "$pkgdir/usr/lib/libgmp."* \
         "$pkgdir/usr/share"
}

# vim: ts=2:sw=2:et:
