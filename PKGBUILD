# Maintainer: Anatol Pomozov <anatol dot pomozov at gmail>

pkgname=chromeos-ecutil-git
pkgver=r28146.8cd0f98ed83
pkgrel=1
pkgdesc='Chromium OS Embedded Controller host tools'
url='http://dev.chromium.org/chromium-os/ec-development'
arch=(i686 x86_64)
depends=(glibc)
makedepends=(git libftdi arm-none-eabi-gcc)
license=(BSD)
source=(git+https://chromium.googlesource.com/chromiumos/platform/ec)
sha1sums=('SKIP')

pkgver() {
  cd ec
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ec
  CROSS_COMPILE_arm=arm-none-eabi- make utils-host
}

package() {
  cd ec/build/elm/util
  install -m755 -d $pkgdir/usr/bin
  install -m755 -t $pkgdir/usr/bin cbi-util ec_parse_panicinfo ec_sb_firmware_update ectool iteflash lbcc lbplay stm32mon uartupdatetool
}
