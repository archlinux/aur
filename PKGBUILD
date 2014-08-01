# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=mcwm-git
pkgver=20130209.2.r11.gee7d9df
pkgrel=2
pkgdesc="A minimalist floating window manager written on top of the XCB"
arch=('i686' 'x86_64')
url="http://hack.org/mc/hacks/mcwm/"
license=('ISC')
depends=('xcb-util-wm' 'xcb-util-keysyms' 'bash')
makedepends=('git')
provides=('mcwm')
conflicts=('mcwm' '2bwm' '2bwm-git') # because of /usr/bin/hidden program
source=("$pkgname::git+https://github.com/bbidulock/mcwm.git" "mcwm.desktop")
md5sums=('SKIP'
	 '8daed020f1a9df4b774207b30d954c53')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}
prepare() {
  cd $pkgname
  ./autogen.sh
}
build() {
  cd $pkgname
  ./configure --prefix=/usr --libexecdir=/usr/lib
  make V=0
}
package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/mcwm.desktop" "$pkgdir/usr/share/xsessions/mcwm.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
