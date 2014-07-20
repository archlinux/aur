# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname='2bwm'
pkgver=0.1
pkgrel=4
pkgdesc="A fast floating window manager"
arch=('i686' 'x86_64')
url="https://github.com/venam/2bwm"
license=('ISC')
depends=('xcb-util-wm' 'xcb-util-keysyms')
conflicts=('2bwm-git' 'mcwm' 'mcwm-git') # due to /usr/bin/hidden program
makedepends=('git' 'xcb-util')
source=("$pkgname::git+https://github.com/venam/2bwm.git#tag=v0.1" '2bwm.desktop' '2bwm.copying')
md5sums=('SKIP'
         '4342d9210effbe4bfb58722f4275aa5c'
         'adaee5c7e455ba15e0ca9a2692464253')

build() {
  cd $pkgname
  make PREFIX=/usr
}
package() {
  cd $pkgname
  make DESTDIR="$pkgdir" PREFIX=/usr MANPREFIX=/usr/share/man install
  install -Dm644 "$srcdir/2bwm.desktop" "$pkgdir/usr/share/xsessions/2bwm.desktop"
  install -Dm644 "$srcdir/2bwm.copying" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
