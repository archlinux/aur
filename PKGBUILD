# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=picsim
pkgver=0.8.1
pkgrel=1
pkgdesc="Emulates some PIC microcontroller and periferics such as USART and timers, the simulator architecture permit easy implementation of external elements in C"
arch=('x86_64')
url='https://github.com/lcgamboa/picsim'
license=('GPL2')
options=('staticlibs')
depends=('glibc')
makedepends=('gcc9' 'doxygen')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lcgamboa/picsim/archive/v${pkgver}.tar.gz")
sha256sums=('e7b58920ef4bdc8720338a38bad6890b687fbc37423e9537e961ac222d47dd73')

prepare() {
  cd "${pkgname}-${pkgver}"
  sed -i "3s|gcc|gcc-9|" src/Makefile
}

build() {
  cd "${pkgname}-${pkgver}/src"
  make
}

package() {
  cd "${pkgname}-${pkgver}/src"
  install -Dm644 libpicsim.so.8.1 -t "${pkgdir}/usr/lib"
  ln -s libpicsim.so.8.1 "${pkgdir}/usr/lib/libpicsim.so.0"
  ln -s libpicsim.so.8.1 "${pkgdir}/usr/lib/libpicsim.so"
  install -Dm644 libpicsim.a -t "${pkgdir}/usr/lib/"
  install -Dm755 picsim -t "${pkgdir}/usr/bin"
  install -Dm644 ../include/*.h -t "${pkgdir}/usr/include/picsim"
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  cp -avR ../docs "${pkgdir}/usr/share/doc/${pkgname}"
  cp -avR ../examples "${pkgdir}/usr/share/doc/${pkgname}"
}