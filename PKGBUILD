# Maintainer: Niels Martignène <niels.martignene@gmail.com>

pkgname=ty
pkgver=0.8.0
pkgrel=1
pkgdesc="GUI and command-line tools to manage Teensy devices"
arch=('x86_64' 'i686')
url="http://github.com/Koromix/ty"
license=('MIT')
depends=('teensyduino' 'libudev.so' 'qt5-base')
makedepends=('imagemagick')
source=("https://github.com/Koromix/ty/archive/v${pkgver}.tar.gz")
sha256sums=('68d3e671f898fa78ff8a57caacc2fabbe52fc84864fe03c5c60de9b1feee542a')

build() {
  cd "ty-${pkgver}"

  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "ty-${pkgver}"

  make install DESTDIR="${pkgdir}"

  for size in 16 32 48 256; do
    mkdir -p "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps"
    convert -resize "${size}x${size}" src/tyqt/images/tyqt.png "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/tyqt.png"
    convert -resize "${size}x${size}" src/upty/images/upty.png "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/upty.png"
  done

  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/ty/LICENSE.txt"
}
