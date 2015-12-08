# Maintainer: George Ornbo <george@shapeshed.com>

pkgname=st-solarized-light
pkgver=0.5
pkgrel=1
pkgdesc='A simple virtual terminal emulator for X.'
arch=('i686' 'x86_64')
license=('MIT')
depends=('libxext' 'libxft')
makedepends=('ncurses')
url="http://st.suckless.org"
source=(http://dl.suckless.org/st/$pkgname-$pkgver.tar.gz
        http://st.suckless.org/patches/st-0.5-no-bold-colors.diff
        http://st.suckless.org/patches/st-solarized-light.diff)

md5sums=('4f8ae2737120a8cba34b23c6020fe51e' 
         '18c28fc0ff19de6c2e4a58a711c91b15'
         '5e27e1fb2831af457519a345ef477af3')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  patch -p1 -i ../st-$pkgver-no-bold-colors.diff
  patch -p1 -i ../st-solarized-light.diff
  cp config.def.h config.h
  sed -i 's/Liberation Mono:pixelsize=12:antialias=false:autohint=false/Inconsolata:pixelsize=16:antialias=true:autohint=true/' config.h 
}

build() {
  cd $srcdir/$pkgname-$pkgver
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
	make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" TERMINFO="$pkgdir/usr/share/terminfo" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
}
