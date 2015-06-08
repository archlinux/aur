# Maintainer: Andreas Schreiner <andreas.schreiner@sonnenmulde.at>
pkgname=libctb
pkgver=0.16
pkgrel=1
pkgdesc="Communications toolbox - ctb. Multiplatform library for different interfaces (RS232, GPIB)"
url="https://iftools.com/opensource/ctb.en.php"
license=('LGPL')
source=(http://iftools.com/download/ctb/0.16/${pkgname}-${pkgver}.tar.gz)
sha512sums=('42e79b04896f1f07d4243ef73b7ff69cedf11639409126329c43b30d0648dea3783f9fc900c9d758363806850f9da4448cf7b4cc67002c5ed8d7a0e62763e67c')
arch=('i686' 'x86_64')
depends=()
makedepends=()

build() {
  cd $srcdir/${pkgname}-${pkgver}/build
  make clean
  make -f GNUmakefile DEBUG=0 GPIB=0
}

package() {
  cd $srcdir/$pkgname-$pkgver/build
  make install DESTDIR=$pkgdir prefix=/usr
  install -m644 -D "$srcdir/$pkgname-$pkgver/include/ctb-$pkgver/kbhit.h" "$pkgdir/usr/include/ctb-$pkgver/kbhit.h"
  install -m644 -D "$srcdir/$pkgname-$pkgver/build/COPYRIGHT" "$pkgdir/usr/share/licenses/$pkgname-$pkgver/COPYRIGHT"
}
