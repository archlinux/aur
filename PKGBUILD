pkgname=usbbootgui-git
_pkgname=usbbootgui
pkgver=1e9cc0f
pkgrel=4
pkgdesc="GUI for booting a Raspberry Pi device like Pi Zero or compute module as a device"
arch=('any')
url="https://github.com/raspberrypi/usbbootgui"
license=('mixed')
depends=(
  'libusb'
  'ncurses'
  'usbboot-git'
)
source=("git+https://github.com/raspberrypi/${_pkgname}.git")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${_pkgname}"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="$pkgdir/" install
  install -Dm644 "${srcdir}/${_pkgname}/debian/99-usbbootgui.rules" "$pkgdir/etc/udev/rules.d/99-usbbootgui.rules"
  install -Dm644 "${srcdir}/${_pkgname}/gpioexpander/output/fixup.dat" "$pkgdir/usr/share/rpiboot/gpioexpand/fixup.dat"
  install -Dm644 "${srcdir}/${_pkgname}/gpioexpander/output/config.txt" "$pkgdir/usr/share/rpiboot/gpioexpand/config.txt"
  install -Dm644 "${srcdir}/${_pkgname}/gpioexpander/output/cmdline.txt" "$pkgdir/usr/share/rpiboot/gpioexpand/cmdline.txt"
  install -Dm644 "${srcdir}/${_pkgname}/gpioexpander/output/gpioexpand.img" "$pkgdir/usr/share/rpiboot/gpioexpand/bootcode.bin"
  install -Dm644 "${srcdir}/${_pkgname}/gpioexpander/output/bootcode.bin" "$pkgdir/usr/share/rpiboot/gpioexpand/bootcode.bin"
  install -Dm644 "${srcdir}/${_pkgname}/gpioexpander/output/bcm2708-rpi-0-w.dtb" "$pkgdir/usr/share/rpiboot/gpioexpand/bcm2708-rpi-0-w.dtb"
  install -Dm644 "${srcdir}/${_pkgname}/gpioexpander/output/bcm2708-rpi-b-plus.dtb" "$pkgdir/usr/share/rpiboot/gpioexpand/bcm2708-rpi-b-plus.dtb"
  install -Dm644 "${srcdir}/${_pkgname}/gpioexpander/output/start.elf" "$pkgdir/usr/share/rpiboot/gpioexpand/start.elf"
  install -Dm644 "${srcdir}/${_pkgname}/gpioexpander/output/kernel.img" "$pkgdir/usr/share/rpiboot/gpioexpand/kernel.img"
  install -Dm644 "${srcdir}/${_pkgname}/gpioexpander/output/overlays/dwc2.dtbo" "$pkgdir/usr/share/rpiboot/gpioexpand/overlays/dwc2.dtbo"
  install -Dm644 "${srcdir}/${_pkgname}/gpioexpander/output/LICENSE" "$pkgdir/usr/share/rpiboot/gpioexpand/LICENSE"
}
