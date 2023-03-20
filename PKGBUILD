# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=snander
pkgver=v.1.7.7
pkgrel=1
pkgdesc="SNANDer - Serial Nor/nAND/Eeprom programmeR (based on CH341A)"
url="https://github.com/McMCCRU/SNANDer"
arch=('any')
license=('GPL2')
source=("SNANDer-$pkgver.tar.gz::https://codeload.github.com/McMCCRU/SNANDer/tar.gz/refs/tags/$pkgver")
sha512sums=('fea53de1d3b14042eb020ea9f0856567df908668eb117beb50d5015d973fc44bfbc73689ce7f604d88c30878bcb6055a34be629c2ac86d0dbd3c8b6884062829')

build() {
  cd "${srcdir}/SNANDer/src"

  sed -i -r "s|^(SNANDer:).*$|\1 \$(OBJS)|g" Makefile

  cd libusb-*
  autoreconf && ./configure --prefix="${srcdir}/SNANDer/src/lusb_build" --disable-udev
  make && make install

  cd ../ && make
}

package() {
  install -D -m755 "${srcdir}/SNANDer/src/SNANDer" "${pkgdir}/usr/bin/snander"
}
