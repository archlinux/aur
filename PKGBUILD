# Maintainer: Patrick Louis <patrick at unixhub dot net>
# Contributor: Brian Bidulock <bidulock@openss7.org>
pkgname=mcwm-git
pkgver=20130209.2.5
pkgrel=1
pkgdesc="A minimalist floating window manager written on top of the XCB"
arch=('i686' 'x86_64')
url="http://hack.org/mc/hacks/mcwm/"
license=('ISC')
depends=('xcb-util' 'xcb-util-wm' 'xcb-util-keysyms')
makedepends=('git')
provides=('mcwm')
conflicts=('mcwm')
source=("$pkgname::git://hack.org/mcwm" "mcwm.desktop")
md5sums=('SKIP'
	 '8daed020f1a9df4b774207b30d954c53')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's,[-_],.,g;s,\.g.*$,,'
}
prepare() {
  cd $pkgname
  sed -i 's,/man/man1,/share/man/man1,' Makefile
}
build() {
  cd $pkgname
  LDFLAGS+=" -Wl,--no-as-needed"
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
