# Contributor: Patrick Jackson <PatrickSJackson gmail com>
# Maintainer: Christoph Vigano <mail@cvigano.de>

pkgname=st-white
_pkgname=st
pkgver=0.6
pkgrel=6
pkgdesc='A simple virtual terminal emulator for X.'
arch=('i686' 'x86_64')
url="http://st.suckless.org"
license=('MIT')
conflicts=($_pkgname)
provides=($_pkgname)
depends=('libxft')
makedepends=('ncurses' 'libxext')
source=("http://dl.suckless.org/st/$_pkgname-$pkgver.tar.gz"
        'config.h')
md5sums=('1a926f450b4eacb7e2f5ac5b8ffea7c8'
         '1e29cadbe01492bbee5e75acee00e3ed')

build() {
  cd $srcdir/$_pkgname-$pkgver
  cp $srcdir/config.h config.h
	make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" TERMINFO="$pkgdir/usr/share/terminfo" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
}
