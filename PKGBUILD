# Maintainer: Martin Schmölzer <mschmoelzer@gmail.com>

pkgname=libopencm3-git
pkgver=r2054.3922cc7d
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
            '2fe07ae84b02c4e9aefb8a0915a611e9da54bbeae11c7454c059e56a7283b4fa')

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
