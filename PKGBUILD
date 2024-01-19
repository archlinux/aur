# Maintainer: K0n24d <konrad AT knauber DOT net>
# Upstream URL: https://github.com/getopenmono/monoprog

pkgname=monoprog
pkgver=0.8.0
pkgrel=1
pkgdesc="Mono device programmer - This is a tool for transferring applications to a Mono device."
arch=('i686' 'x86_64' 'armv5' 'armv6h' 'armv6' 'armv7h' 'armv7' 'aarch64')
url="https://github.com/getopenmono/monoprog"
license=('MIT')
depends=('libusb' 'qt5-base' 'qt5-serialport')
source=("monoprog-${pkgver}.tar.gz::https://github.com/getopenmono/monoprog/archive/v${pkgver}.tar.gz")
md5sums=('2a81a7dc731fc1ceec61fe00bc178bff')

MAKEFLAGS="-j$(nproc)"

build() {
  cd "${srcdir}/monoprog-${pkgver}/src"
  qmake -o bin/Makefile monoprog.pro
  qmake -o bin/unittest/Makefile unittests.pro
  cd bin
  make
}

package() {
  install -Dm755 "${srcdir}/monoprog-${pkgver}/src/bin/monoprog" \
    "${pkgdir}/usr/bin/monoprog"
  install -Dm644 "${srcdir}/monoprog-${pkgver}/src/package/debian/etc-udev-rules.d-openmono.rules" \
    "${pkgdir}/etc/udev-rules.d/openmono.rules"
  install -Dm644 "${srcdir}/monoprog-${pkgver}/LICENSE.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
