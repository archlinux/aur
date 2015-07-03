# Contributor: codestation <codestation404 at gmail dot com>
pkgname=ciso
pkgver=1.0.0
pkgrel=1
pkgdesc="PSP Iso Compressor"
arch=(i686 x86_64)
url="http://ciso.tenshu.fr"
license=('GPL')
depends=('zlib')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('6091333f30fd61852d7d629b937aee34')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  # Avoid warnings about memset/memcpy
  sed -i '/#include <stdlib.h>/ a\#include <string.h>' ciso.c
  # Replace data type 'long' with 'int' for mantain structure sizes in 32/64 bits
  sed -i '/long long/!s/long/int/' ciso.c ciso.h
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "${pkgdir}/usr/bin"
  make DESTDIR="${pkgdir}" install
}
