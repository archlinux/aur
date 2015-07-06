# Maintainer: Dmytro Kostiuchenko <edio@archlinux.us>
# Contributor: Gilrain <pierre.buard+aur gmail com>

pkgname=prismatik-git
pkgver=5.11.2.r0.g46ca39e
pkgrel=1
pkgdesc="A controler for usb driven LED backlights."
arch=('i686' 'x86_64')
url="https://github.com/woodenshark/Lightpack"
license=('GPL3')
depends=('qt5-serialport' 'libxkbcommon-x11')
makedepends=('git' 'libusb' 'pkg-config')
provides=('lightpack' 'prismatik')
install='prismatik.install'
source=('git://github.com/woodenshark/Lightpack.git')
sha256sums=('SKIP')

pkgver() {
  cd Lightpack
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd Lightpack/Software
  qmake-qt5 -recursive
  make
}

check() {
  cd Lightpack/Software
  make check
}

package() {
  cd Lightpack
  install -Dm755 "Software/src/bin/Prismatik" "${pkgdir}/usr/bin/prismatik"
  install -Dm644 "Software/dist_linux/deb/etc/udev/rules.d/93-lightpack.rules" "${pkgdir}/etc/udev/rules.d/93-lightpack.rules"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/prismatik/README.md"
  install -Dm644 "Software/CHANGELOG" "${pkgdir}/usr/share/doc/prismatik/CHANGELOG"
}
