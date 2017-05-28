# Maintainer: Niels Martignène <niels.martignene@gmail.com>

pkgname=ty
pkgver=0.8.5
pkgrel=1
pkgdesc="Collection of tools to manage Teensy boards"
arch=('x86_64' 'i686')
url="http://github.com/Koromix/tytools"
license=('custom:Unlicense')
depends=('teensyduino' 'libudev.so' 'qt5-base')
makedepends=('imagemagick')
source=("https://github.com/Koromix/ty/archive/v${pkgver}.tar.gz")
sha256sums=('a4ae6b3f39e491c21fe58b6bd84c158cbb7cad3bade2c7159dffbf1d2f026583')

build() {
  cd "tytools-${pkgver}"

  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "tytools-${pkgver}"

  make install DESTDIR="${pkgdir}"

  for size in 16 32 48 256; do
    mkdir -p "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps"
    convert -resize "${size}x${size}" resources/images/tycommander.png \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/tycommander.png"
    convert -resize "${size}x${size}" resources/images/tyupdater.png \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/tyupdater.png"
  done

  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/ty/LICENSE.txt"
}
