# Contributors:
#   Alexander Ulrich <a.ulrich@student.uni-tuebingen.de>
#   henning mueller <henning@orgizm.net>

pkgname=gatling
pkgver=0.13
pkgrel=1
pkgdesc='A high performance http, ftp and smb server'
arch=(i686 x86_64)
url=http://www.fefe.de/gatling/
license=(GPL)
depends=(openssl)
makedepends=(libowfat dietlibc polarssl)
source=(
  http://dl.fefe.de/$pkgname-$pkgver.tar.bz2
)
sha256sums=(
  b42145fdf7b66602fa8bc64661c2762172f6d33dbd9d53efebf821cd81e89245
)

build() {
  cd $srcdir/$pkgname-$pkgver

  sed -i '0,/\/man/s//\/share\/man/' GNUmakefile
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver

  make prefix=$pkgdir/usr install

  _docdir=$pkgdir/usr/share/doc/gatling
  mkdir -p $_docdir && cp README* $_docdir
}
