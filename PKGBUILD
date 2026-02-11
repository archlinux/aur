# Maintainer: Maxwell Pray <synthead@gmail.com>

pkgname=pioasm
pkgver=2.2.0
pkgrel=1
pkgdesc="Assemble file of PIO program(s) for use in applications."
arch=('x86_64')
url="https://github.com/raspberrypi/pico-sdk"
license=('custom:BSD-3-Clause')
makedepends=('cmake')
source=("https://github.com/raspberrypi/pico-sdk/releases/download/$pkgver/pico-sdk-$pkgver.tar.gz")
sha256sums=('2678fe2b176cf64a7f71cd91749fdf9134c8cf7ff84b7199dfe5ea0d6dba6fa4')

build() {
  cd "$srcdir/pico-sdk-$pkgver/tools/pioasm"

  mkdir build
  cd build
  cmake .. -DPIOASM_VERSION_STRING="$pkgver"
  make
}

package() {
  install -Dm 755 "$srcdir/pico-sdk-$pkgver/tools/pioasm/build/pioasm" "$pkgdir/usr/bin/pioasm"
  install -Dm 755 "$srcdir/pico-sdk-$pkgver/LICENSE.TXT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.TXT"
}
