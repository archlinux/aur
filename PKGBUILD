# Maintainer:  mrxx <mrxx at cyberhome dot at>
# Contributor: Jeff Youdontneedtoknow <jeffpublicjr at gmail dot com>
# Contributor: yetist <yetist@gmail.com>

pkgname=gmchess
pkgver=0.29.6
pkgrel=5
pkgdesc="Play Chinese chess (Xiangqi) against a human opponent or the computer"
arch=("i686" "x86_64")
url="https://salsa.debian.org/chinese-team/gmchess"
license=('GPL2')
depends=("gtkmm")
makedepends=('pkgconfig' 'intltool')
conflicts=('gmchess-bin' 'eleeye-bin' 'convert-pgn-bin')
source=("$pkgname-$pkgver.tar.gz::https://salsa.debian.org/chinese-team/gmchess/-/archive/master/${pkgname}-master.tar.gz" 'board-fix-segfault.patch')
sha1sums=('26fb365af83d3364a699175718ca0573c0b62ca5'
          '49e378db48b0d10188480084f6bd9f2c0d0d28e2')

prepare() {
	cd "$srcdir/${pkgname}-master"
	patch -p0 -i "${srcdir}/board-fix-segfault.patch"
}

build() {
   cd "$srcdir/${pkgname}-master"
   autoreconf --install
   autoconf
   ./configure --prefix=/usr
   make
   make  DESTDIR="$srcdir" install
   } 
   
package(){
  install -d -m755 $pkgdir/usr
  install -d -m755 $pkgdir/usr/share
  install -d -m755 $pkgdir/usr/share/locale
  install -d -m755 $pkgdir/usr/share/man
  install -d -m755 $pkgdir/usr/share/$pkgname
  install -d -m755 $pkgdir/usr/share/applications
  install -d -m755 $pkgdir/usr/lib
  install -d -m755 $pkgdir/usr/bin
  
  cp -r $srcdir/usr/share/locale/ $pkgdir/usr/share/
  cp -r $srcdir/usr/share/man/ $pkgdir/usr/share/
  cp -r $srcdir/usr/share/$pkgname/ $pkgdir/usr/share
  install -D -m644 $srcdir/usr/share/applications/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -D -m644 $srcdir/usr/share/pixmaps/$pkgname.png $pkgdir/usr/share/icons/$pkgname.png
  cp -r $srcdir/usr/lib $pkgdir/usr
  cp -r $srcdir/usr/bin $pkgdir/usr
}
