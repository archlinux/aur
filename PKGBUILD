# Maintainer: Martin Schmölzer <mschmoelzer@gmail.com>

pkgname=libopencm3-git
pkgver=r2167.dc64929b
pkgrel=1
pkgdesc='Open Source firmware library for various ARM Cortex microcontrollers'
arch=(any)
url='http://www.libopencm3.org/'
license=(GPL)
makedepends=(git arm-none-eabi-gcc arm-none-eabi-newlib python-yaml)
options=(!strip staticlibs !buildflags)
source=(git://github.com/libopencm3/libopencm3.git
        0001-Revert-Drop-install-target-and-documentation.patch)
sha256sums=('SKIP'
            '73d9a5f007e7e61a71b28dedb41fdfe88e976c1aa2c728f34bd0b5049b6d30fe')

pkgver() {
  cd libopencm3
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd libopencm3
  patch -p1 < ../0001-Revert-Drop-install-target-and-documentation.patch
}

build() {
  cd libopencm3
  make
}

package() {
  cd libopencm3
  make DESTDIR="$pkgdir" PREFIX=/usr/arm-none-eabi install
}
