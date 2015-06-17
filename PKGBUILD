# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=menuconfig-git
pkgver=r17.0a95e19
pkgrel=1
pkgdesc='Standalone version of the mconf tool from the linux kernel'
url='https://github.com/TheGeorge/menuconfig'
arch=(i686 x86_64)
license=(GPL2)
depends=(ncurses)
makedepends=(git cmake)
source=(git://github.com/TheGeorge/menuconfig.git)
sha1sums=('SKIP')

pkgver() {
  cd menuconfig
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd menuconfig
  sed -e 's|ncursesw/curses.h|curses.h|' -i lxdialog/dialog.h
}

build() {
  cd menuconfig
  cmake .
  make
}

package() {
  cd menuconfig
  install -m755 -d "$pkgdir/usr/bin"
  install -m755 -t "$pkgdir/usr/bin" conf mconf
}
