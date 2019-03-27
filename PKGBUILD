# Maintainer: Edward Pacman <edward at edward-p.xyz>

pkgname=broadcom-bt-firmware-git
pkgdesc="Broadcom bluetooth firmware."
conflicts=('bcm4335c0-firmware' 'bcm4350c5-firmware' 'bcm4356a2-firmware' 'bcm20702a1-firmware' 'bcm20702b0-firmware' 'bcm20703a1-firmware' 'bcm43142a0-firmware')
provides=('bcm4335c0-firmware' 'bcm4350c5-firmware' 'bcm4356a2-firmware' 'bcm20702a1-firmware' 'bcm20702b0-firmware' 'bcm20703a1-firmware' 'bcm43142a0-firmware')
pkgver=12.0.1.1011_p1.r3.gc0bd928
pkgrel=2
arch=('any')
makedepends=('git')
url="https://github.com/winterheart/broadcom-bt-firmware"
license=('custom')
source=("git+https://github.com/winterheart/broadcom-bt-firmware.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/broadcom-bt-firmware"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  #Install firmwares
  cd "${srcdir}/broadcom-bt-firmware/brcm"
  for i in *.hcd; do
    install -Dm644 "$i" "${pkgdir}/usr/lib/firmware/brcm/$i"
  done

  #Install LICENSE
  cd ..
  install -Dm644 LICENSE.MIT.txt "${pkgdir}/usr/license/broadcom-bt-firmware-git/LICENSE.MIT.txt"
  install -Dm644 LICENSE.broadcom_bcm20702 "${pkgdir}/usr/license/broadcom-bt-firmware-git/LICENSE.broadcom_bcm20702"
}

