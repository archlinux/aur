# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=mcwm
pkgver=20130209.2
pkgrel=2
pkgdesc="A minimalist floating window manager written on top of the XCB"
arch=('i686' 'x86_64')
url="http://hack.org/mc/hacks/mcwm/"
license=('ISC')
depends=('xcb-util-wm' 'xcb-util-keysyms')
makedepends=('git')
source=("$pkgname::git://hack.org/mcwm#tag=20130209-2" "mcwm.desktop")
md5sums=('SKIP'
	 '8daed020f1a9df4b774207b30d954c53')

prepare() {
  cd $pkgname
  sed -i 's,/man/man1,/share/man/man1,' Makefile
}
build() {
  cd $pkgname
  make
}
package() {
  cd $pkgname
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/man/man1"
  make "PREFIX=$pkgdir/usr" install
  install -Dm644 "$srcdir/mcwm.desktop" "$pkgdir/usr/share/xsessions/mcwm.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
