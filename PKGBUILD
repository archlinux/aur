# Maintainer: Ysblokje <ysblokje at gmail dot com>
# Previous Maintainer: Jeff Youdontneedtoknow <jeffpublicjr at gmail dot com>
# Contributer: Arnaud
pkgname=('opentx-companion')
pkgver=2.2.3
pkgrel=1
pkgdesc="EEPROM Editor for OpenTX RC transmitter firmwares"
arch=('x86_64')
url="http://www.open-tx.org/"
license=('GPL')
depends=('qt5-base' 'qt5-multimedia' 'qt5-svg' 'sdl' 'hicolor-icon-theme')
optdepends=('dfu-util: tool for flashing stm32 based radios')
makedepends=('cmake' 'xsd' 'bc' 'python' 'avr-gcc' 'avr-libc' 'sed' 'qt5-tools' 'python-pyqt5' 'arm-none-eabi-gcc' 'arm-none-eabi-binutils' 'arm-none-eabi-newlib' 'fox' 'python-pillow')
provides=('companion')
conflicts=('companion' 'companion9x-svn')
source=("https://github.com/opentx/opentx/archive/$pkgver.tar.gz"
"installprefix.patch"
)
#"qt5_modules.patch"
sha256sums=(
    '58d39b1be84af58ef2db3b4a77eecad3884269a9a1f3efe8ebcf17feaa49cf50'
    '9d669cf723e98b7be5463538b0590ae7776b3b866a423cceeb30ba9840748c64'
)
    #'30fd1396a47bfc250780786e52447547aafcf934c6fe1775e4301fa3c7185be2'

build() {
  patch $srcdir/opentx-$pkgver/tools/build-companion-release.sh $startdir/installprefix.patch
#  cd $srcdir/opentx-$pkgver
#  patch -t -p 1 < $startdir/qt5_modules.patch
  $srcdir/opentx-$pkgver/tools/build-companion-release.sh $srcdir/opentx-$pkgver dummy
}


package() {
  cd $srcdir/build
  make -j`nproc` DESTDIR=$pkgdir/ install
  cd $pkgdir/usr/share/applications
  sed -i -e 's/Categories=Application/Categories=Development;/' companion22.desktop
  sed -i -e 's/Categories=Application/Categories=Development;/' simulator22.desktop
}

