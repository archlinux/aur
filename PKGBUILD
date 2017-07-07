# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=menuconfig-git
pkgver=r687.2f3597f
pkgrel=1
pkgdesc='Standalone version of the mconf tool from the linux kernel'
url='https://github.com/anatol/menuconfig'
arch=(i686 x86_64)
license=(GPL2)
depends=(ncurses)
makedepends=(git gperf)
source=(git://github.com/anatol/menuconfig.git)
sha1sums=('SKIP')

pkgver() {
  cd menuconfig
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd menuconfig
  sed -e 's|register unsigned int len|register size_t len|' -i zconf.gperf
}

build() {
  cd menuconfig
  make conf mconf
}

package() {
  cd menuconfig
  install -m755 -d "$pkgdir/usr/bin"
  install -m755 -t "$pkgdir/usr/bin" conf mconf
}
