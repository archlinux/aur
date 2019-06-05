# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

pkgname=mdk4
pkgver=4.1
pkgrel=1
pkgdesc="MDK is a proof-of-concept tool to exploit common IEEE 802.11 protocol weaknesses"
url="https://github.com/aircrack-ng/mdk4"
arch=("x86_64")
license=('GPL2')
depends=('libpcap')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/aircrack-ng/${pkgname}/archive/${pkgver}.tar.gz)
sha512sums=('b1472458ca02bf94f8717ac70b631f994c38cb67012fc38df0b6859778790b220447e6c1b3f15558e8f203da06ffa83bd36e5f037cb704e893c3fcf329022adc')

prepare() {
  cd ${pkgname}-${pkgver}
  sed "s|/usr/local|/usr|g" -i Makefile
  sed "s|$(PREFIX)/sbin|$(PREFIX)/bin|g" -i Makefile
  sed "s|$(PREFIX)/sbin|$(PREFIX)/bin|g" -i src/Makefile
  sed "s|PREFIX:=|PREFIX=|g" -i Makefile
}

build() {
  cd ${pkgname}-${pkgver}
  make
}
package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="$pkgdir/" install
  install -Dm 644 docs/*.html -t "${pkgdir}/usr/share/doc/${pkgname}"
}
