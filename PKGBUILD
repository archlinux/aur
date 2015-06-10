# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname='twobwm-git'
pkgver=r349.3e0b5a7
pkgrel=1
pkgdesc="A fast floating window manager"
arch=('i686' 'x86_64')
url="https://github.com/venam/2bwm"
license=('ISC')
depends=('xcb-util' 'xcb-util-wm' 'xcb-util-keysyms')
makedepends=('git')
options=('!buildflags')
source=("$pkgname::git+https://github.com/venam/2bwm.git#branch=devel" 'twobwm.desktop' 'twobwm.copying')
md5sums=('SKIP'
         '2f5065ed6e09f05c05200c06bd3e2629'
         'adaee5c7e455ba15e0ca9a2692464253')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
  cd $pkgname
  make CC=gcc PREFIX=/usr
}
package() {
  cd $pkgname
  make DESTDIR="$pkgdir" PREFIX=/usr MANPREFIX=/usr/share/man install
  install -Dm644 "$srcdir/twobwm.desktop" "$pkgdir/usr/share/xsessions/twobwm.desktop"
  install -Dm644 "$srcdir/twobwm.copying" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
