pkgname=usbboot-git
_pkgname=usbboot
pkgver=2048ae6
pkgrel=3
pkgdesc="rpiboot and bin2c executables used by usbbootgui"
arch=('any')
url="https://github.com/raspberrypi/usbboot"
license=('Apache License')
depends=(
  'libusb'
)
source=("git+https://github.com/raspberrypi/${_pkgname}.git")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${_pkgname}"
  sed -i 's/plugdev/uucp/g' "${srcdir}/${_pkgname}/debian/99-rpiboot.rules"
  sed -i 's/plugdev/uucp/g' "${srcdir}/${_pkgname}/main.c"
  make
}

package() {
  install -Dm644 "${srcdir}/${_pkgname}/debian/99-rpiboot.rules" "$pkgdir/etc/udev/rules.d/99-rpiboot.rules"
  install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "$pkgdir/usr/share/rpiboot/LICENSE"
  install -Dm755 "${srcdir}/${_pkgname}/bin2c" "$pkgdir/usr/bin/bin2c"
  install -Dm755 "${srcdir}/${_pkgname}/rpiboot" "$pkgdir/usr/bin/rpiboot"

  install -Dm644 "${srcdir}/${_pkgname}/msd/bootcode.bin" "$pkgdir/usr/share/rpiboot/msd/bootcode.bin"
  install -Dm644 "${srcdir}/${_pkgname}/msd/bootcode4.bin" "$pkgdir/usr/share/rpiboot/msd/bootcode4.bin"
  install -Dm755 "${srcdir}/${_pkgname}/msd/start.elf" "$pkgdir/usr/share/rpiboot/msd/start.elf"
  install -Dm755 "${srcdir}/${_pkgname}/msd/start4.elf" "$pkgdir/usr/share/rpiboot/msd/start4.elf"

  install -Dm644 "${srcdir}/${_pkgname}/recovery/bootcode4.bin" "$pkgdir/usr/share/rpiboot/recovery/bootcode4.bin"
  install -Dm644 "${srcdir}/${_pkgname}/recovery/config.txt" "$pkgdir/usr/share/rpiboot/recovery/config.txt"
  install -Dm644 "${srcdir}/${_pkgname}/recovery/pieeprom-2021-02-16.bin" "$pkgdir/usr/share/rpiboot/recovery/pieeprom-2021-02-16.bin"
  install -Dm644 "${srcdir}/${_pkgname}/recovery/pieeprom.bin" "$pkgdir/usr/share/rpiboot/recovery/pieeprom.bin"
  install -Dm644 "${srcdir}/${_pkgname}/recovery/pieeprom.original.bin" "$pkgdir/usr/share/rpiboot/recovery/pieeprom.original.bin"
  install -Dm644 "${srcdir}/${_pkgname}/recovery/pieeprom.sig" "$pkgdir/usr/share/rpiboot/recovery/pieeprom.sig"
}
