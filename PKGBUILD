# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=mcwm
pkgver=20130209.2
pkgrel=5
pkgdesc="A minimalist floating window manager written on top of the XCB"
arch=('i686' 'x86_64')
url="http://hack.org/mc/hacks/mcwm/"
license=('ISC')
depends=('xcb-util-wm' 'xcb-util-keysyms')
conflicts=('mcwm-git' '2bwm' '2bwm-git') # because of /usr/bin/hidden program
source=("http://hack.org/mc/hacks/mcwm/mcwm-20130209-2.tar.bz2" "mcwm.desktop")
md5sums=('d36a625c966067c80cf9f14609a21921'
         '8daed020f1a9df4b774207b30d954c53')

prepare() {
  cd $pkgname-20130209-2
  sed -i 's,/man/man1,/share/man/man1,' Makefile
}
build() {
  cd $pkgname-20130209-2
  make
}
package() {
  cd $pkgname-20130209-2
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/man/man1"
  make "PREFIX=$pkgdir/usr" install
  install -Dm644 "$srcdir/mcwm.desktop" "$pkgdir/usr/share/xsessions/mcwm.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
