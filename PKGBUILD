# Maintainer: Ysblokje <ysblokje at gmail dot com>
# Previous Maintainer: Jeff Youdontneedtoknow <jeffpublicjr at gmail dot com>
# Contributer: Arnaud
# 
# Use with care, I accept no responsibility what so ever.
pkgname=('opentx-companion')
pkgver=2.3.1
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
sha256sums=(
    'e3bbc599146aa77c34cb425a66b3963cefc4a09a3035a038ddd738bb890134ac'
    'ffe1e86925ecb4f42e0fc96edddf61f85fea8b3da041a0634fff19434c618b5b'
)

build() {
  patch $srcdir/opentx-$pkgver/tools/build-companion-release.sh $startdir/installprefix.patch
  $srcdir/opentx-$pkgver/tools/build-companion-release.sh $srcdir/opentx-$pkgver dummy
}


package() {
  cd $srcdir/build
  make -j`nproc` DESTDIR=$pkgdir/ install
  cd $pkgdir/usr/share/applications
  sed -i -e 's/Categories=Application/Categories=Development;/' companion23.desktop
  sed -i -e 's/Categories=Application/Categories=Development;/' simulator23.desktop
}

