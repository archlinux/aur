# Maintainer:  Jose Riha <jose1711 gmail com>

pkgname=psani-profi
pkgver=3.4.00
pkgrel=1
pkgdesc="Program that will teach you touchtyping (czech)"
arch=('i686' 'x86_64')
url="http://www.sallyx.org/sally/psani-vsemi-deseti/"
license=('GPL')
depends=('bash' 'xorg-luit')
source=("http://www.sallyx.org/sally/download.php?file=psani-vsemi-deseti%2F${pkgname}_${pkgver}.tar.gz")
md5sums=('2e134cbba21faf217daba71611506b5b')

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
  sed -i '/LC_ALL/s!\(.*\)luit \(.*\)\(/usr/bin/psani-profi.*\)!\1luit \3!' $pkgdir/usr/bin/psani
  chown -R root:root $pkgdir/usr/share/psanipb
}
