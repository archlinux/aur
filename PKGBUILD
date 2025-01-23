# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
# Contributors:
#   Alexander Ulrich <a.ulrich@student.uni-tuebingen.de>
#   Mildred <silkensedai@online.fr>
#   henning mueller <henning@orgizm.net>
#   Stefan J. Betz <info@stefan-betz.net>

pkgname=libowfat
pkgver=0.34
pkgrel=2
pkgdesc='GPL reimplementation of libdjb'
arch=(i686 x86_64)
url=http://www.fefe.de/libowfat/
makedepends=(dietlibc)
license=(GPL-2.0-or-later)
install=libowfat.install
options=(staticlibs)
source=(
  http://www.fefe.de/$pkgname/$pkgname-$pkgver.tar.xz{,.sig}
)
validpgpkeys=('2DEC330151BB9F7DAD8B0BDCFC32CEECA534A9C6')
sha256sums=('d4330d373ac9581b397bc24a22ad1f7f5d58a7fe36d9d239fe352ceffc5d304b'
            'SKIP')

build() {
  cd $srcdir/$pkgname-$pkgver
  DIET=/usr/bin/diet make headers
  DIET=/usr/bin/diet make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  DIET=/usr/bin/diet make prefix=$pkgdir/usr/ LIBDIR=$pkgdir/usr/lib MAN3DIR=$pkgdir/usr/share/man/man3 install

  cd $pkgdir/usr/share/man/man3
  mv buffer.3 buffer-libowfat.3
}
