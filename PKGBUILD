# Maintainer: Adrián Laviós <adrian@lavios.eu>
pkgname=mtm-git
pkgver=r332.688b883
pkgrel=1
pkgdesc="Perhaps the smallest useful terminal multiplexer in the world."
arch=('i686' 'x86_64')
url="https://github.com/deadpixi/mtm"
license=('GPL')
depends=('ncurses')
provides=('mtm')
makedepends=('git')
source=('git+https://github.com/deadpixi/mtm.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/mtm"
  echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/mtm"
  make HEADERS='-DNCURSESW_INCLUDE_H="<ncurses.h>"'
}

package() {
  cd "$srcdir/mtm"
  install -Dm755 "mtm" "$pkgdir/usr/bin/mtm"
  install -Dm644 "mtm.1" "$pkgdir/usr/share/man/man1/mtm.1"
  install -dm755 "$pkgdir/usr/share/terminfo"
  tic -s -x -o"$pkgdir/usr/share/terminfo" mtm.ti
}

# vim:set ts=2 sw=2 et:
