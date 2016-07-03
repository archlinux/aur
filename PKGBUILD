# Maintainer: buckket <buckket@cock.li>
# Contributor: Niels Martignène <niels.martignene@gmail.com>

pkgname=arduino-mk
pkgver=1.5.1
pkgrel=1
pkgdesc='A Makefile for Arduino Sketches'
arch=(any)
url='https://github.com/sudar/Arduino-Makefile'
license=('LGPL2.1')
depends=('arduino' 'make' 'python-pyserial')
optdepends=('screen: monitor support'
            'picocom: monitor support')
source=("https://github.com/sudar/Arduino-Makefile/archive/${pkgver}.tar.gz")
sha256sums=('91a41838685f1f52bf3a7da770f633a76be4b0dd71aea94a484b9827c56315bf')

prepare() {
  cd "${srcdir}/Arduino-Makefile-${pkgver}"

  find -name ".gitignore" -delete
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

