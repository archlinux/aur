# Maintainer: Benoit Favre <benoit.favre@lif.univ-mrs.fr>
pkgname=mpeg_lib
pkgver=1.3.1
pkgrel=1
pkgdesc="C library for decoding MPEG-1 video streams (legacy)"
arch=(i686 x86_64)
url="http://www.gerg.ca/software/mpeglib/"
license=('GPL')
source=(http://fossies.org/unix/misc/old/$pkgname-$pkgver.tar.gz)
md5sums=('9d803be0073f42acf87d5fbb339a183b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make CFLAGS=-fPIC shlib
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  LD_LIBRARY_PATH=. make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -d "$pkgdir/usr/lib" "$pkgdir/usr/include"
  install -m 0644 mpeg.h "$pkgdir/usr/include/mpeg.h"
  install -m 0644 libmpeg.a "$pkgdir/usr/lib/libmpeg.a"
  install -m 0644 libmpeg.so "$pkgdir/usr/lib/libmpeg.so"
}

# vim:set ts=2 sw=2 et:
