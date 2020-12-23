#Maintainer: Dmytro Aleksandrov <alkersan@gmail.com>

pkgname=rpi-imager
pkgver=1.5
pkgrel=1
pkgdesc="Raspberry Pi Imaging Utility"
depends=('curl' 'libarchive' 'qt5-base' 'qt5-declarative' 'qt5-quickcontrols2' 'qt5-svg' 'qt5-tools')
makedepends=('gcc' 'make' 'cmake')
arch=('any')
url="https://github.com/raspberrypi/rpi-imager"
license=("Apache")

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")

sha256sums=('972592886b4ff448b34bd420817f7b019c40fdab6ccef7acbc69986c1904e39c')

build() {
  rm -rf build
  cmake -B build -S "${pkgname}-${pkgver}" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr'

  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
