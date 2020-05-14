# Maintainer: null2264 <palembani@gmail.com>
pkgname=st-ziro-git
_pkgname=st
pkgver=r1129.873330b
pkgrel=1
epoch=1
pkgdesc="ZiRO or AAP's personal build of st (simple terminal) with Xresources, transparency, etc."
url='https://github.com/null2264/st-zi'
arch=('i686' 'x86_64')
license=('MIT')
options=('zipman')
depends=('libxft')
makedepends=('ncurses' 'libxext' 'git')
source=('git://github.com/null2264/st-zi')
sha1sums=('SKIP')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
  cd st-zi
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd st-zi
  # skip terminfo which conflicts with ncurses
  sed -i '/\@tic /d' Makefile
}

build() {
  cd st-zi
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd st-zi
  make PREFIX=/usr DESTDIR="$pkgdir" TERMINFO="$pkgdir/usr/share/terminfo" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
}
