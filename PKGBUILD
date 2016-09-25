# Maintainer: Niels Martignène <niels.martignene@gmail.com>

pkgname=ty
pkgver=0.7.6
pkgrel=1
pkgdesc="GUI and command-line tools to manage Teensy devices"
arch=('x86_64' 'i686')
url="http://github.com/Koromix/ty"
license=('MIT')
depends=('teensyduino' 'libudev.so' 'qt5-base')
makedepends=('imagemagick')
source=("https://github.com/Koromix/ty/archive/v${pkgver}.tar.gz")
sha256sums=('b21118f494d76df0f9bf15a9e6799068a0dc7a288c0cc7b5be7e38336deaac3a')

build() {
  cd "ty-${pkgver}"

  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "ty-${pkgver}"

  make install DESTDIR="${pkgdir}"
  rm -rf "${pkgdir}/usr/lib/udev"

  for size in 16 32 48 256; do
    mkdir -p "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps"
    convert -resize "${size}x${size}" tyqt/images/tyqt.png "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/tyqt.png"
  done

  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/ty/LICENSE.txt"
}
