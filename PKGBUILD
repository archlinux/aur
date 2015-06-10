# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Serge Ziryukin <ftrvxmtrx@gmail.com>

pkgname=pdcurses
pkgver=3.4
pkgrel=6
pkgdesc='Cross-platform (DOS, OS/2, Win32, X11 and SDL) curses implementation'
arch=('x86_64' 'i686')
url='https://github.com/macton/pdcurses'
license=('GPL')
depends=('xaw3d' 'bash' 'sdl')
source=("$pkgname-$pkgver.tgz::https://github.com/macton/$pkgname/archive/master.tar.gz")
options=('staticlibs')
sha256sums=('9b9185071a0ccfe8ae06ddd8fc75c2afecf5ebc54812f4de821d563114a97e12')

build() {
  cd "$pkgname-master"

  ./configure --prefix=/usr --enable-widec --enable-xim --with-xaw3d --with-x
  make
  make -C sdl1
}

package() {
  cd "$pkgname-master"

  make DESTDIR="$pkgdir" install
  install -c -m 644 curspriv.h "$pkgdir/usr/include/xcurses/curspriv.h"
  install -c -m 644 sdl1/pdcsdl.h "$pkgdir/usr/include/xcurses/pdcsdl.h"
  install -c -m 644 sdl1/libpdcurses.a "$pkgdir/usr/lib/libpdcurses.a"
  ln -sf libXCurses.a $pkgdir/usr/lib/libXpanel.a
  ln -sf libXCurses.so $pkgdir/usr/lib/libXpanel.so
}

# vim:set ts=2 sw=2 et:
