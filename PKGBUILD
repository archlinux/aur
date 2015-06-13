# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=teapot
pkgver=2.3.0
pkgrel=2
pkgdesc="Table Editor and Planner.  A 3D curses based spreadsheet for mathy people."
arch=('i686' 'x86_64')
#url="http://www.moria.de/~michael/teapot/"
url="http://www.syntax-k.de/projekte/teapot/"
license=('GPL3')
depends=('ncurses')
optdepends=('fltk: for gui')
makedepends=('cmake')
conflicts=('mesa-demos')
#source=(http://www.moria.de/~michael/$pkgname/$pkgname-$pkgver.tar.gz)
source=(http://www.syntax-k.de/projekte/$pkgname/$pkgname-$pkgver.tar.gz
        http://www.syntax-k.de/projekte/$pkgname/Teapot-$pkgver-win32.zip)
md5sums=('ae59f90a5f70971703abccf0991dbd58'
         'e2a7a7efccc3478c3993325bc02275b3')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr CMakeLists.txt 
  make teapot
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  # todo, patch make install to not require Lyx
  #make DESTDIR="$pkgdir" install
  install -Dm755 teapot "$pkgdir/usr/bin/teapot"
  mkdir -p  "$pkgdir/usr/share/teapot/"
  find "$srcdir/Teapot-$pkgver-win32/" -type f -exec chmod -x '{}' \;
  cp -r "$srcdir/Teapot-$pkgver-win32/share/doc/teapot/"  "$pkgdir/usr/share/"
  cp -r "$srcdir/$pkgname-$pkgver/examples/" "$pkgdir/usr/share/teapot"
  install -Dm644 teapot.1 "$pkgdir/usr/share/man/man1/teapot.1"
}


