# Maintainer: Simon Wilper <sxw@chronowerks.de>
pkgname=unit-convert
pkgver=2.2.0
pkgrel=3
pkgdesc="Qt Unit Conversion Tool"
url="https://www.chronowerks.de/pub/"
arch=('x86_64' 'i686')
license=('LGPL2')
depends=('qt5-base' 'qt5-script')
source=("https://www.chronowerks.de/pub/${pkgname}-${pkgver}.tar.gz")
sha512sums=('7cb1663adaa8137f6521b866d781e3e3a8123c29f4f0fd4a378ae1ddd4d2aaecddad6448736aea2747d36e004e4943c5b0dda52b04661a2200dfb32f237a03c4')
 
build() {
  cd "${pkgname}-${pkgver}"
  qmake convert.pro
  make
  rcc --verbose --compress 9 --binary -o data.rcc res/main.qrc
}
 
package() {
  install -d -m755 ${pkgdir}/usr/share/convert/
  install -d -m755 ${pkgdir}/usr/bin/
  install -m755 ${srcdir}/${pkgname}-${pkgver}/bin/convert ${pkgdir}/usr/bin/unit-convert
  install -m644 ${srcdir}/${pkgname}-${pkgver}/data.rcc ${pkgdir}/usr/share/convert/
}
