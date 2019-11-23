# Maintainer: Donald Webster <fryfrog@gmail.com>
# Contributor: Edmunt Pienkowsky <roed@onet.eu>

pkgname=rpi-eeprom
pkgver=20191111
pkgrel=1
pkgdesc='Raspberry Pi4 boot EEPROM updater'
arch=('any')
url='http://github.com/raspberrypi/rpi-eeprom'
license=('custom')
depends=('raspberrypi-firmware' 'binutils' 'sed' 'grep')
optdepends=('flashrom')
backup=('etc/default/rpi-eeprom-update')
source=('rpi-eeprom::git+https://github.com/raspberrypi/rpi-eeprom.git')
sha256sums=('SKIP')
options=(!strip)

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  mkdir -p "${pkgdir}/usr/lib/firmware/raspberrypi/bootloader"
  cp -rfv rpi-eeprom/firmware/* "${pkgdir}/usr/lib/firmware/raspberrypi/bootloader"

  mkdir -p "${pkgdir}/usr/lib/rpi-eeprom"
  cp -fv rpi-eeprom/rpi-eeprom-update "${pkgdir}/usr/lib/rpi-eeprom"

  mkdir -p "${pkgdir}/etc/default"
  cp -fv rpi-eeprom/rpi-eeprom-update-default "${pkgdir}/etc/default/rpi-eeprom-update"

  mkdir -p "${pkgdir}/usr/bin"
  ln -s /usr/lib/firmware/raspberrypi/bootloader/vl805 "${pkgdir}/usr/bin/vl805"
  ln -s /usr/lib/rpi-eeprom/rpi-eeprom-config "${pkgdir}/usr/bin/rpi-eeprom-config"
}
