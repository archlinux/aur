# Maintainer:  Jose Riha <jose1711 gmail com>

pkgname=psani-profi
pkgver=3.3.00
pkgrel=2
pkgdesc="Program that will teach you touchtyping (czech)"
arch=('i686' 'x86_64')
url="http://www.sallyx.org/sally/psani-vsemi-deseti/"
license=('GPL')
depends=('bash' 'xorg-luit')
source=("http://www.sallyx.org/sally/psani-vsemi-deseti/start.php?target=download&file=${pkgname}_${pkgver}")
md5sums=('51f3b930ac46a562326cc587704258cf')

build() {
  cd $srcdir; zcat start.php\?target=download\&file=${pkgname}_${pkgver} | tar xf -
  cd "$srcdir/${pkgname}_${pkgver}/zdrojaky"
  ./configure --with-zobraz-test --with-lat-dir=/usr/share --with-prg-dir=/usr/bin --with-man-dir=/usr/share/man
  make
  ./configure --with-zobraz-test --with-lat-dir=$pkgdir/usr/share --with-prg-dir=$pkgdir/usr/bin --with-man-dir=$pkgdir/usr/share/man
}

package() {
  cd "$srcdir/${pkgname}_${pkgver}/zdrojaky"
  #./configure --with-zobraz-test --with-lat-dir=$pkgdir/usr/share --with-prg-dir=$pkgdir/usr/bin --with-man-dir=$pkgdir/usr/share/man
  make install
  # this is useless - we have pacman
  rm $pkgdir/usr/bin/${pkgname}-${pkgver}-uninstall.sh
  sed -i '/LC_ALL/s!\(.*\)luit \(.*\)\(/usr/bin/psani-profi.*\)!\1luit \3!' $pkgdir/usr/bin/psani
  chown -R root:root $pkgdir/usr/share/psanipb
}
