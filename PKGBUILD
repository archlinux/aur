# Maintainer: Niels Martignène <niels.martignene@gmail.com>

pkgname=arduino-mk
pkgver=1.5
pkgrel=1
pkgdesc="A Makefile for Arduino Sketches"
arch=(any)
url="https://github.com/sudar/Arduino-Makefile"
license=('LGPL2.1')
depends=('arduino' 'make' 'python' 'python-pyserial')
source=("https://github.com/sudar/Arduino-Makefile/archive/${pkgver}.tar.gz")
sha256sums=('4b05faff3c5b647471652420b2b80a3f6edbf4fa08d422476cd4c2d546b44441')

prepare() {
  cd "${srcdir}/Arduino-Makefile-${pkgver}"

  find -name ".gitignore" -delete
}

build() {
  cd "${srcdir}/Arduino-Makefile-${pkgver}"
}

package() {
  cd "${srcdir}/Arduino-Makefile-${pkgver}"

  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/arduino"
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/man/man1"

  install -m755 bin/ard-reset-arduino "${pkgdir}/usr/bin/"
  install -m644 *.mk arduino-mk-vars.md "${pkgdir}/usr/share/arduino/"

  cp -r README.md examples "${pkgdir}/usr/share/doc/${pkgname}/"
  install -m644 ard-reset-arduino.1 "${pkgdir}/usr/share/man/man1/"
}

