# Maintainer: jjacky
pkgname=pkgclip
pkgver=1.0.0
pkgrel=1
pkgdesc="Cached Packages Trimmer Utility"
arch=('i686' 'x86_64')
url="https://bitbucket.org/jjacky/pkgclip"
license=('GPL3+')
depends=('dbus' 'polkit' 'gtk3' 'pacman>=4.0.1')
source=(https://bitbucket.org/jjacky/$pkgname/downloads/$pkgname-$pkgver.tar.gz)
md5sums=('4595389fa49b8c0f27a7928b6c32e215')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  # fix: silly bug in the Makefile, the icon wasn't installed anymore...
  echo "/* XPM */" > pkgclip.xpm
  cat xpm.h >> pkgclip.xpm
  install -D -m644 pkgclip.xpm $pkgdir/usr/share/pixmaps/pkgclip.xpm
}

# vim:set ts=2 sw=2 et:
