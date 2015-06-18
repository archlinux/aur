# Maintainer: David Adler <david dot jo dot adler at gmail dot com>
# Contributor: Arch Linux Pro Audio <dev@archaudio.org>
# Contributor: svoufff <svoufff at gmail dot com>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
pkgname=qmidiroute
pkgver=0.3.0
pkgrel=3
pkgdesc="a filter/router for MIDI events"
arch=('i686' 'x86_64')
url="http://alsamodular.sourceforge.net/"
license=('GPL')
depends=('qt4')
source=(http://downloads.sourceforge.net/alsamodular/$pkgname-$pkgver.tar.bz2 $pkgname.desktop)
md5sums=('8f2dfc9f0abc5d243e365b919926dc55'
         '40a978928bb4795ac28b9387074875bb')
build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}
package() { 
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  # Install .desktop and icon
  install -D -m644 src/pixmaps/qmidiroute_48.xpm $pkgdir/usr/share/pixmaps/qmidiroute_48.xpm
  install -D -m644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

  # Install doc
  mkdir -p $pkgdir/usr/share/doc/$pkgname
  install -m644 {ChangeLog,NEWS,README,TODO} $pkgdir/usr/share/doc/$pkgname
}

# vim:set ts=2 sw=2 et:
