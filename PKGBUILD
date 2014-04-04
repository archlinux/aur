# Contributor: erm67
# Contributor: Stefan Husmann <Stefan-Husmann@t-online.de>
pkgname=xpaint
pkgver=2.9.10
pkgrel=2
pkgdesc="A color image editing tool which features most standard \
paint program options."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/sf-xpaint/"
license=('GPL')
depends=('libxaw3dxft' 'libpgf' 'libpng' 'libtiff' 'libxft' 'libxpm')
optdepends=('gv: external viewer for PostScript output' 'imagemagick: external viewer for pixel graphics')
source=(xpaint.desktop \
http://downloads.sourceforge.net/sourceforge/sf-$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('8833e2a72c90f3c0242f9b8335eeacef'
         '8608e4e034aa6c09541070fcecc527e0')
options=('!makeflags')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  [ -L xaw_incdir ] && rm xaw_incdir
  ln -s /usr/include/X11/Xaw3dxft xaw_incdir 
  sed -i 's,freetype2/freetype,freetype2,g' configure 
}

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr 
  make 
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
  install -Dm644 XPaintIcon.xpm $pkgdir/usr/share/pixmaps/XPaintIcon.xpm
  install -Dm644 $srcdir/$pkgname.desktop \
    $pkgdir/usr/share/applications/$pkgname.desktop
  rm $pkgdir/usr/share/xpaint/XPaintIcon.xpm
}
