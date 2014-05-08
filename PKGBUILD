# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Massimiliano Brocchini <brocchini@netseven.it>

pkgname=chbg
pkgver=1.5
pkgrel=5
pkgdesc="Periodically change background image in X11. Can be a slideshow screensaver too"
arch=('i686' 'x86_64')
url="http://chbg.sourceforge.net/about.html"
license=('GPL')
depends=('gtk' 'imlib2')
source=(http://downloads.sourceforge.net/chbg/$pkgname-$pkgver.tgz)
md5sums=('3ee8b01a7e089570f66d89dac353cc2c')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export CPPFLAGS="$CPPFLAGS -I/usr/include/libpng12"
  export PNG_LIBS="-lpng12"
  ./configure --with-image-library=imlib2 --prefix=/usr --mandir=/usr/share/man || return 1
  make
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 "chbg.desktop" "$pkgdir/usr/share/applications/chbg.desktop"
  install -Dm644 "chbg_64x64.xpm" "$pkgdir/usr/share/pixmaps/chbg_64x64.xpm"
}
