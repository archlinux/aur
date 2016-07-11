# Maintainer: Anatol Pomozov <anatol dot pomozov at gmail>

pkgname=chromeos-ecutil-git
pkgver=r5553.9a710bd
pkgrel=1
pkgdesc='Chromium OS Embedded Controller host tools'
url='http://dev.chromium.org/chromium-os/ec-development'
arch=(i686 x86_64)
depends=(glibc)
makedepends=(git libftdi)
license=(BSD)
source=(git+https://chromium.googlesource.com/chromiumos/platform/ec)
sha1sums=('SKIP')

pkgver() {
  cd ec
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ec
  make utils-host
}

package() {
  cd ec/build/bds/util
  install -m755 -d $pkgdir/usr/bin
  install -m755 -t $pkgdir/usr/bin ec_sb_firmware_update ectool lbcc lbplay stm32mon
}
