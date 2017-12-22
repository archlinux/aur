# Maintainer: Ysblokje <ysblokje at gmail dot com>
# Previous Maintainer: Jeff Youdontneedtoknow <jeffpublicjr at gmail dot com>
# Contributer: Arnaud
pkgname=('opentx-companion')
pkgver=2.2.1
pkgrel=1
pkgdesc="EEPROM Editor for OpenTX RC transmitter firmwares"
arch=('x86_64')
url="http://www.open-tx.org/"
license=('GPL')
depends=('qt5-base' 'qt5-multimedia' 'qt5-svg' 'sdl' 'hicolor-icon-theme')
makedepends=('cmake' 'xsd' 'bc' 'python' 'avr-gcc' 'avr-libc' 'sed' 'qt5-tools' 'python-pyqt5' 'arm-none-eabi-gcc' 'arm-none-eabi-binutils' 'arm-none-eabi-newlib' 'fox')
provides=('companion')
conflicts=('companion' 'companion9x-svn')
source=("https://github.com/opentx/opentx/archive/$pkgver.tar.gz"
"installprefix.patch"
)
sha256sums=(
    '626e8f6c48d686b41311b633326811cab6788bb667185cb0e3ec0f0d627390af'
    '9d669cf723e98b7be5463538b0590ae7776b3b866a423cceeb30ba9840748c64'
)

build() {
  patch $srcdir/opentx-$pkgver/tools/build-companion-release.sh $startdir/installprefix.patch
  $srcdir/opentx-$pkgver/tools/build-companion-release.sh $srcdir/opentx-$pkgver dummy
}


package() {
  cd build
  make -j`nproc` DESTDIR=$pkgdir/ install
  cd $pkgdir/usr/share/applications
  sed -i -e 's/Categories=Application/Categories=Development;/' companion22.desktop
  sed -i -e 's/Categories=Application/Categories=Development;/' simulator22.desktop
}

