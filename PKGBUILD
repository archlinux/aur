# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Marlock <marlock87 at hotmail.com>

pkgname=naufrago
pkgver=0.4
pkgrel=3
pkgdesc="Naufrago! is a simple offline RSS reader (including images) written in Python2."
arch=('any')
url="http://sourceforge.net/projects/naufrago/"
license=('GPL')
depends=('python2-feedparser' 'pygtk' 'python2-pysqlite' 'python2-notify' 'pywebkitgtk')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.bz2
        naufrago_launcher.sh
        naufrago.desktop)
md5sums=('9bd8e692de2357224ff05b5c6207b65b'
         '7d2abc8b6cd0421aeabf07d624a240d7'
         'a0df923165a8a594c13329df1a93b9b9')


prepare() {
  cd "$srcdir/$pkgname"

  sed -i "s/distro_package = False/distro_package = True/g" naufrago.py
}

package() {
  cd "$srcdir/$pkgname"

  mkdir -p $pkgdir/usr/share/naufrago/

  cp -dpr --no-preserve=ownership * $pkgdir/usr/share/naufrago/

  install -Dm755 $srcdir/naufrago_launcher.sh $pkgdir/usr/bin/naufrago_launcher.sh
  install -Dm655 $srcdir/naufrago.desktop $pkgdir/usr/share/applications/naufrago.desktop
  rm $pkgdir/usr/share/naufrago/{naufrago.desktop,naufrago_launcher.sh,update_0.x_to_0.4.py}
}
