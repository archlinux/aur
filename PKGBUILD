# Maintainer: Dmitry Kharitonov <darksab0r@gmail.com>
# Contributor: mmm
# Contributor: Woody Gilk <woody@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=xaralx
pkgver=0.7_rev1785
pkgrel=9
pkgdesc="An advanced vector graphics program, development release"
arch=('i686' 'x86_64')
url="http://www.xaraxtreme.org/"
license=('GPL')
depends=('wxgtk' 'gtk2' 'libpng' 'libjpeg' 'libxml2')
makedepends=('pkgconfig')
optdepends=('imagemagick: needed for some conversions')
install=${pkgname}.install
source=(http://downloads.xara.com/opensource/xaralx${pkgver}.tar.bz2)
md5sums=('14c6b270bcc1598b9b3d38f9a6db71aa')

if [ "$CARCH" = "x86_64" ]; then
     depends[${#optdepends[@]}]='lib32-libstdc++5'
     depends[${#optdepends[@]}]='lib32-pangox-compat'
     depends[${#optdepends[@]}]='lib32-gtk2'
elif [ "$CARCH" = "i686" ]; then
     depends[${#optdepends[@]}]='libstdc++5'
     depends[${#optdepends[@]}]='pangox-compat'
     depends[${#optdepends[@]}]='gtk2'
fi


package() {
  cd $srcdir/$pkgname
## needed for source/svn build 
#  autoreconf -f -i -s
#  ./configure --prefix=/usr --enable-filters  \
#    --enable-xarlib --disable-svnversion --with-gnu-ld
#  make 
#  make DESTDIR=$pkgdir install

  install -d $pkgdir/usr/bin $pkgdir/usr/share/xaralx/doc $pkgdir/usr/share/licenses/xaralx
  install -D -m755 bin/* $pkgdir/usr/bin 
  cp -R share/xaralx $pkgdir/usr/share/
  chmod -R 644 $pkgdir/usr/share/xaralx
  install -D -m644 share/xaralx/doc/LICENSE $pkgdir/usr/share/licenses/xaralx/LICENSE 
  # Desktop compatibility
  install -D -m644 $pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
  install -D -m644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -D -m644 $pkgname.xml $pkgdir/usr/share/mime/packages/$pkgname.xml
}