# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
# Contributors:
#   Alexander Ulrich <a.ulrich@student.uni-tuebingen.de>
#   Mildred <silkensedai@online.fr>
#   henning mueller <henning@orgizm.net>
#   Stefan J. Betz <info@stefan-betz.net>

pkgname=libowfat
pkgver=0.33
pkgrel=1
pkgdesc='GPL reimplementation of libdjb'
arch=(i686 x86_64)
url=http://www.fefe.de/libowfat/
makedepends=(dietlibc)
license=(GPL)
install=libowfat.install
conflicts=(tinycdb)
options=(staticlibs)
source=(
  http://www.fefe.de/$pkgname/$pkgname-$pkgver.tar.xz{,.sig}
)
validpgpkeys=('2DEC330151BB9F7DAD8B0BDCFC32CEECA534A9C6')
sha256sums=('311ec8b3f4b72bb442e323fb013a98f956fa745547f2bc9456287b20d027cd7d'
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
