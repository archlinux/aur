# Maintainer: K0n24d <konrad AT knauber DOT net>
# Upstream URL: https://github.com/getopenmono/monoprog

pkgname=monoprog
pkgver=0.7.0
pkgrel=1
pkgdesc="Mono device programmer - This is a tool for transferring applications to a Mono device."
arch=('i686' 'x86_64' 'armv5' 'armv6h' 'armv6' 'armv7h' 'armv7' 'aarch64')
url="https://github.com/getopenmono/monoprog"
license=('MIT')
depends=('libusb' 'qt5-base')
source=("monoprog-${pkgver}.tar.gz::https://github.com/getopenmono/monoprog/archive/v${pkgver}.tar.gz")
md5sums=('66b5cdc94799a8ba0d16d3cf4db8db69')

MAKEFLAGS="-j$(nproc)"

build() {
  cd "${srcdir}/monoprog-${pkgver}"
  qmake -o bin/Makefile monoprog.pro
  qmake -o bin/unittest/Makefile unittests.pro
  cd bin
  make
}

package() {
  install -Dm755 "${srcdir}/monoprog-${pkgver}/bin/monoprog" \
    "${pkgdir}/usr/bin/monoprog"
  install -Dm644 "${srcdir}/monoprog-${pkgver}/package/debian/etc-udev-rules.d-openmono.rules" \
    "${pkgdir}/etc/udev-rules.d/openmono.rules"
  install -Dm644 "${srcdir}/monoprog-${pkgver}/LICENSE.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
