# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=menuconfig-git
pkgver=r907.0982864
pkgrel=1
pkgdesc='Standalone version of the mconf tool from the linux kernel'
url='https://github.com/anatol/menuconfig'
arch=(i686 x86_64)
license=(GPL2)
depends=(ncurses)
makedepends=(git ninja)
source=(git://github.com/anatol/menuconfig.git)
sha1sums=('SKIP')

pkgver() {
  cd menuconfig
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd menuconfig
  sed -i "s/common_cflags =/common_cflags = $CFLAGS/" build.ninja
  sed -i "s/common_ldflags =/common_ldlags = $LDFLAGS/" build.ninja
}

build() {
  cd menuconfig
  ninja
}

package() {
  cd menuconfig
  install -m755 -d "$pkgdir/usr/bin"
  install -m755 -t "$pkgdir/usr/bin" conf mconf
}
