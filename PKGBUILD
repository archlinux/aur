# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>

pkgname=libmpc
pkgver=1.3.1
pkgrel=1
pkgdesc='Library for the arithmetic of complex numbers with arbitrarily high precision'
arch=(x86_64)
url='http://www.multiprecision.org/'
license=(LGPL)
depends=(mpfr)
source=(https://ftp.gnu.org/gnu/mpc/mpc-${pkgver/_/-}.tar.gz{,.sig})
sha256sums=('ab642492f5cf882b74aa0cb730cd410a81edcdbec895183ce930e706c1c759b8'
            'SKIP')
validpgpkeys=('AD17A21EF8AED8F1CC02DBD9F7D5C9BF765C61E3')  # Andreas Enge

build() {
  cd mpc-$pkgver
  ./configure --prefix=/usr \
              --enable-static \
              --disable-shared \
              --enable-cxx FLAGS=-fPIC CPPFLAGS=-DPIC
  make
}

check() {
  cd mpc-$pkgver
  make check
}

package() {
  cd mpc-$pkgver
  make DESTDIR="$pkgdir" install
  mv "$pkgdir"/usr/share/info/{mpc,libmpc}.info
  rm -rf "${pkgdir}/usr/include"
  rm -rf "${pkgdir}/usr/share"
}
