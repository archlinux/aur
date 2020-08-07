# Maintainer: TDY <tdy@archlinux.info>

pkgname=levee
pkgver=4.0
pkgrel=1
pkgdesc="A small, modal text editor based on vi"
arch=('i686' 'x86_64')
url="http://www.pell.portland.or.us/~orc/Code/levee/"
license=('MIT')
depends=('ncurses')
conflicts=('lv') # see the build() function
source=(http://www.pell.portland.or.us/~orc/Code/$pkgname/$pkgname-$pkgver.tar.bz2
        COPYING)
md5sums=('e834d6c6547a51127613bc818cd6876c'
         'c3c3b5129975a2e707e2870735753853')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # An 'lv' link is created for convenience, conflicting with the 'lv' package.
  # Uncomment the next line to skip the symlink if you also want the 'lv' package.
  #sed -i '/LN_S/d' Makefile.in

  ./configure.sh --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX="$pkgdir" install
  install -Dm644 ../COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
