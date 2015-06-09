# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=secp256k1
pkgver=20140202
pkgrel=2
pkgdesc="Optimized C library for secp256k1 ECDSA"
arch=('i686' 'x86_64')
url="https://github.com/sipa/secp256k1"
depends=('gmp' 'openssl')
makedepends=('gcc' 'yasm')
license=('MIT')
source=(http://gavwood.com/secp256k1.tar.bz2)
sha256sums=('8d22c571e2934be51816883eb8351995849d8e04603d63a76fe95b8b40ebecb4')

build() {
  cd $srcdir/$pkgname

  msg 'Building...'
  ./configure
  make
}

package() {
  cd $srcdir/$pkgname

  msg 'Installing...'
  install -Dm 644 include/secp256k1.h $pkgdir/usr/include/secp256k1.h
  install -Dm 644 obj/secp256k1.o $pkgdir/usr/lib/secp256k1.o
  install -Dm 644 libsecp256k1.a $pkgdir/usr/lib/libsecp256k1.a
  install -Dm 755 libsecp256k1.so $pkgdir/usr/lib/libsecp256k1.so
  if [[ "$CARCH" == x86_64 ]]; then
    install -Dm 644 obj/field_5x52_asm.o $pkgdir/usr/lib/field_5x52_asm.o
  fi
}
