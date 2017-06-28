# Maintainer: Ysblokje <ysblokje at gmail dot com>
# Previous Maintainer: Jeff Youdontneedtoknow <jeffpublicjr at gmail dot com>
# Contributer: Arnaud
pkgname=('opentx-companion')
pkgver=2.2.0
pkgrel=3
pkgdesc="EEPROM Editor for OpenTX RC transmitter firmwares"
arch=('x86_64')
url="http://www.open-tx.org/"
license=('GPL')
depends=('qt5-base' 'qt5-multimedia' 'qt5-svg' 'sdl')
makedepends=('cmake' 'xsd' 'bc' 'python' 'avr-gcc' 'avr-libc' 'sed' 'qt5-tools' 'python-pyqt5' 'arm-none-eabi-gcc' 'arm-none-eabi-binutils' 'arm-none-eabi-newlib' 'fox')
provides=('companion')
conflicts=('companion' 'companion9x-svn')
source=("https://github.com/opentx/opentx/archive/$pkgver.tar.gz"
"installprefix.patch"
)
sha256sums=(
    '27a07efcbb7d5759bafea7d8a6d97f910c2830881c0d4c71cbbc7da65446b2cd'
    '9d669cf723e98b7be5463538b0590ae7776b3b866a423cceeb30ba9840748c64'
)

build() {
  patch $srcdir/opentx-$pkgver/tools/build-companion-release.sh $startdir/installprefix.patch
  $srcdir/opentx-$pkgver/tools/build-companion-release.sh $srcdir/opentx-$pkgver dummy
}


package() {
  cd build
  make DESTDIR=$pkgdir/ install
  cd $pkgdir/usr/share/applications
  sed -i -e 's/Categories=Application/Categories=Development;/' companion22.desktop
  sed -i -e 's/Categories=Application/Categories=Development;/' simulator22.desktop
}

