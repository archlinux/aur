# Maintainer: Edward Pacman <micro.fedora <AT> gmail <dot> com>

pkgname=broadcom-bt-firmware-git
pkgdesc="Broadcom bluetooth firmware."
conflicts=('bcm4335c0-firmware' 'bcm4350c5-firmware' 'bcm4356a2-firmware' 'bcm20702a1-firmware' 'bcm20702b0-firmware' 'bcm20703a1-firmware' 'bcm43142a0-firmware')
provides=('bcm4335c0-firmware' 'bcm4350c5-firmware' 'bcm4356a2-firmware' 'bcm20702a1-firmware' 'bcm20702b0-firmware' 'bcm20703a1-firmware' 'bcm43142a0-firmware')
pkgver=12.0.1.1011_p1.r3.gc0bd928
pkgrel=1
arch=('any')
url="https://github.com/winterheart/broadcom-bt-firmware"
license=("Custom")
source=("git+https://github.com/winterheart/broadcom-bt-firmware.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/broadcom-bt-firmware"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/broadcom-bt-firmware/brcm"
  mkdir -p ${pkgdir}/usr/lib/firmware/brcm
  for i in *.hcd; do
    install -m644 "$i" "${pkgdir}/usr/lib/firmware/brcm/$i"
  done
}

