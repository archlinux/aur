# Maintainer: Martin Schmölzer <mschmoelzer@gmail.com>

pkgname=libopencm3-git
pkgver=r1638.3a106db
pkgrel=1
pkgdesc='Open Source firmware library for various ARM Cortex microcontrollers'
arch=(any)
url='http://www.libopencm3.org/'
license=(GPL)
makedepends=(git arm-none-eabi-gcc arm-none-eabi-newlib python-yaml)
options=(!strip staticlibs)
source=(git://github.com/libopencm3/libopencm3.git)
sha256sums=('SKIP')

pkgver() {
  cd libopencm3
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd libopencm3
  make lib
}

package() {
  cd libopencm3
  make DESTDIR="$pkgdir" PREFIX=/usr/arm-none-eabi install
}
