# Maintainer: Niels Martignène <niels.martignene@gmail.com>

pkgname=ty
pkgver=0.6.4
pkgrel=1
pkgdesc="GUI and command-line tools to manage Teensy devices"
arch=('x86_64' 'i686')
url="http://github.com/Koromix/ty"
license=('custom:MPL2')
depends=('teensyduino' 'libudev.so' 'qt5-base')
makedepends=('imagemagick')
install="ty.install"
source=("https://github.com/Koromix/ty/archive/v${pkgver}.tar.gz")
sha256sums=('32a170ca8f18af82b46d41485a2afbd29bc07fbb3a13eb11279271d459683b53')

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
    convert -resize "${size}x${size}" resources/images/tyqt.png "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/tyqt.png"
  done

  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/ty/LICENSE.txt"
}
