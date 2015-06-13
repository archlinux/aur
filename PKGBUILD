# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=qodem
pkgver=0.3.2
pkgrel=1
pkgdesc="A re-implementation of the DOS-era Qmodem serial communications package."
arch=('i686' 'x86_64')
url="http://qodem.sourceforge.net/"
license=('GPL')
depends=('ncurses' 'libx11')
source=(http://downloads.sourceforge.net/project/qodem/qodem/$pkgver/qodem-$pkgver.tar.gz)
md5sums=('36f0effbde999f7138eb94d773c0412d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure #--enable-x11
  # missing ncurses wide header?
  sed -i 's|ncursesw/||' qcurses.h
  make PREFIX=/usr CFLAGS='-lm'
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  # okay, it ignores prefix
  cd "$pkgdir"
  mv usr/local/bin usr/bin
  mv usr/local/share usr/share
  rmdir usr/local
}

