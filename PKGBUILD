# Maintainer: Ysblokje <ysblokje at gmail dot com>
# Previous Maintainer: Jeff Youdontneedtoknow <jeffpublicjr at gmail dot com>
# Contributer: Arnaud
# pinned package. For those that wish to remain on 2.1 branch
pkgname=opentx-companion21
pkgver=2.1.9
pkgrel=4
pkgdesc="EEPROM Editor for OpenTX RC transmitter firmwares 2.1 releases" 
arch=('x86_64')
url="http://www.open-tx.org/"
license=('GPL')
depends=('qt5-base' 'qt5-multimedia' 'qt5-svg' 'sdl' 'hicolor-icon-theme')
optdepends=('dfu-util: tool for flashing stm32 based radios')
makedepends=('cmake' 'xsd' 'bc' 'python' 'avr-gcc' 'avr-libc' 'sed' 'qt5-tools' 'python-pyqt5' 'arm-none-eabi-gcc' 'arm-none-eabi-binutils' 'arm-none-eabi-newlib' 'fox')
provides=('companion')
conflicts=('companion' 'companion9x-svn' 'opentx-companion')
source=("https://github.com/opentx/opentx/archive/$pkgver.tar.gz"
)
sha256sums=(
    '13c7d5dbafb1ab086b24e5e7e0836af867a6f2b982d0c5167cf1fc918de6a299'
)

build() {
  cd $srcdir/opentx-$pkgver/companion
  mkdir -p lbuild
  cd lbuild
  cmake -DCMAKE_INSTALL_PREFIX=/usr ../src
  make
}

#prepare() {
#  cd $srcdir/opentx-$pkgver
#  patch -p1 -i ../opentx-$pkgver-gcc6.patch
#}

package() {
  cd $srcdir/opentx-$pkgver/companion/lbuild
  make DESTDIR=$pkgdir/ install
  cd $pkgdir/usr/share/applications
  sed -i -e 's/Categories=Application/Categories=Development;/' companion21.desktop
  sed -i -e 's/Categories=Application/Categories=Development;/' simulator21.desktop
  rm -Rf $pkgdir/lib
}
