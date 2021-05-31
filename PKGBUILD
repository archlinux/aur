# $Id$
# Maintainer: Grey Christoforo <grey at christoforo dot net>

pkgname=linak-usb-desk-control-git
pkgver=r76.5e37dcf
pkgrel=1
pkgdesc="Talk to LINAK actuators via usb2lin06"
arch=(x86_64)
url="https://github.com/UrbanskiDawid/usb2lin06-HID-in-linux-for-LINAK-Desk-Control-Cable"
license=(MIT)
depends=(
libusb)
source=("git+https://github.com/UrbanskiDawid/usb2lin06-HID-in-linux-for-LINAK-Desk-Control-Cable.git")
md5sums=('SKIP')

pkgver() {
  cd usb2lin06-HID-in-linux-for-LINAK-Desk-Control-Cable
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
 cd usb2lin06-HID-in-linux-for-LINAK-Desk-Control-Cable

}

build() {
  cd usb2lin06-HID-in-linux-for-LINAK-Desk-Control-Cable
  make program
}

package() {
  cd usb2lin06-HID-in-linux-for-LINAK-Desk-Control-Cable

  mkdir -p "${pkgdir}"/usr/bin

  cd EXAMPLES
  for f in example-*
  do
    cp $f "${pkgdir}"/usr/bin/${f/example/linak}
  done

  mkdir -p "${pkgdir}/etc/udev/rules.d"
  echo 'SUBSYSTEM=="usb", ATTR{idVendor}=="12d3", ATTR{idProduct}=="0002", GROUP="uucp", MODE="0660"' > "${pkgdir}"/etc/udev/rules.d/41-linak.rules
}
