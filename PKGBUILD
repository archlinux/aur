# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Contributor: Niels Martignène <niels.martignene@gmail.com>
# Contributor: Nicolas Avrutin <nicolasavru@gmail.com>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: Adam Honse <calcprogrammer1@gmail.com>

pkgname=hidapi-hotplug-git
pkgver=r714.bc0a241
pkgrel=1
pkgdesc='Simple library for communicating with USB and Bluetooth HID devices with hotplug support'
arch=(x86_64)
url='https://gitlab.com/OpenRGBDevelopers/hidapi-hotplug'
license=('GPL3' 'BSD' 'custom')
depends=('systemd-libs')
optdepends=('libusb: for hidapi-hotplug-libusb')
makedepends=('cmake' 'libusb' 'git')
provides=('hidapi-hotplug' 'libhidapi-hotplug-hidraw.so' 'libhidapi-hotplug-libusb.so')
source=("git+https://gitlab.com/OpenRGBDevelopers/hidapi-hotplug.git")
sha512sums=('SKIP')

pkgver() {
  cd hidapi-hotplug
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cmake -B build -S hidapi-hotplug -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
