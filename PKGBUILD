# Maintainer: Joe Neeman <joeneeman@gmail.com>
# Contributor: Rémy Oudompheng <remy@archlinux.org>

pkgname=frobby
pkgver=0.9.0
pkgrel=2
pkgdesc="Computations With Monomial Ideals"
arch=('i686' 'x86_64')
url="http://www.broune.com/frobby/"
license=('GPL')
depends=('gmp')
source=(http://www.broune.com/frobby/frobby_v$pkgver.tar.gz
        missing-include.patch
        update-gmp.patch)
md5sums=('2204f340dad8fb7be156f9f7c403c4a0'
         'e3f32bb4e9360fcb4f7eccad6275ffc0'
         'c5e95fbbb7942aa00258f7070e98723c')

build() {
  cd "$srcdir/frobby_v$pkgver"
  patch -Np1 -i "${srcdir}/missing-include.patch"
  patch -Np1 -i "${srcdir}/update-gmp.patch"
  make CFLAGS="$CFLAGS" CPPFLAGS="$CPPFLAGS"
  make CFLAGS="$CFLAGS" CPPFLAGS="$CPPFLAGS" library
}

package() {
  cd "$srcdir/frobby_v$pkgver"
  install -D -m 755 bin/frobby $pkgdir/usr/bin/frobby 
  install -D -m 644 bin/libfrobby.a $pkgdir/usr/lib/libfrobby.a
  install -D -m 644 src/frobby.h $pkgdir/usr/include/frobby.h
  install -D -m 644 src/stdinc.h $pkgdir/usr/include/stdinc.h
}

