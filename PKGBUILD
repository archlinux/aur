# Maintainer:  Jose Riha <jose1711 gmail com>

pkgname=psani-profi
pkgver=3.4.01
pkgrel=2
pkgdesc="Program that will teach you touchtyping (czech)"
arch=('i686' 'x86_64')
url="http://www.sallyx.org/sally/psani-vsemi-deseti/"
license=('GPL')
depends=(bash luit)
source=("http://www.sallyx.org/sally/download.php?file=psani-vsemi-deseti%2F${pkgname}_${pkgver}.tar.gz" "psani")
md5sums=('104efc83c44987416386ae6607c96537'
         '0fca5f75d5166b2b44a8420217f3099e')

build() {
  cd "$srcdir/${pkgname}_${pkgver}/zdrojaky"
  ./configure --with-zobraz-test --with-lat-dir=/usr/share --with-prg-dir=/usr/bin --with-man-dir=/usr/share/man
  make
  ./configure --with-zobraz-test --with-lat-dir=$pkgdir/usr/share --with-prg-dir=$pkgdir/usr/bin --with-man-dir=$pkgdir/usr/share/man
}

package() {
  cd "$srcdir/${pkgname}_${pkgver}/zdrojaky"
  #./configure --with-zobraz-test --with-lat-dir=$pkgdir/usr/share --with-prg-dir=$pkgdir/usr/bin --with-man-dir=$pkgdir/usr/share/man
  make DESTDIR=$pkgdir install
  # this is useless - we have pacman
  rm $pkgdir/usr/bin/${pkgname}-${pkgver}-uninstall.sh
  # sed -i '/LC_ALL/s!\(.*\)luit \(.*\)\(/usr/bin/psani-profi.*\)!\1luit \3!' $pkgdir/usr/bin/psani
  install -Dm755 $srcdir/psani $pkgdir/usr/bin/psani
  chown -R root:root $pkgdir/usr/share/psanipb
}
