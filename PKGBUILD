# Maintainer: Viacheslav Chimishuk <vchimishuk@yandex.ru>

pkgname=arduino-mk-git
pkgrel=1
pkgver=1.5.2.r6.g08b4f44
provides=('arduino-mk')
conflicts=('arduino-mk')
pkgdesc='A Makefile for Arduino Sketches'
arch=(any)
url="https://github.com/sudar/Arduino-Makefile"
license=('LGPL2.1')
depends=('arduino' 'make' 'python-pyserial')
optdepends=('screen: monitor support'
            'picocom: monitor support')
source=("git://github.com/sudar/Arduino-Makefile")
md5sums=('SKIP')

prepare() {
  cd "${srcdir}/Arduino-Makefile"

  find -name ".gitignore" -delete
}

package() {
  cd "${srcdir}/Arduino-Makefile"

  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/arduino"
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/man/man1"

  install -m755 bin/ard-reset-arduino "${pkgdir}/usr/bin/"
  install -m644 *.mk arduino-mk-vars.md "${pkgdir}/usr/share/arduino/"

  cp -r README.md examples "${pkgdir}/usr/share/doc/${pkgname}/"
  install -m644 ard-reset-arduino.1 "${pkgdir}/usr/share/man/man1/"
}

pkgver() {
    cd "${srcdir}/Arduino-Makefile"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
