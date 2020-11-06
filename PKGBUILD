# Maintainer: Simon Wilper <sxw@chronowerks.de>
pkgname=unit-convert
pkgver=2.2.0
pkgrel=4
pkgdesc="Qt Unit Conversion Tool"
url="https://www.chronowerks.de/pub/"
arch=('x86_64' 'i686')
license=('LGPL2')
depends=('qt5-base' 'qt5-script')
source=("https://www.chronowerks.de/pub/${pkgname}-${pkgver}.tar.gz")
sha512sums=('9623329f92746d312df9183f924074d651f86e89adf4b84bd533cb16647c3899d1a40f4845657942f8715c26afd5d5e56776ed67473c56031257c86cfb316b92')
 
build() {
  # cd "${pkgname}-${pkgver}"
  qmake convert.pro
  make
  rcc --verbose --compress 9 --binary -o data.rcc res/main.qrc
}
 
package() {
  install -d -m755 ${pkgdir}/usr/share/convert/
  install -d -m755 ${pkgdir}/usr/bin/
  install -m755 ${srcdir}/bin/convert ${pkgdir}/usr/bin/unit-convert
  install -m644 ${srcdir}/data.rcc ${pkgdir}/usr/share/convert/
}
