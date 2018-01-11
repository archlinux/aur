# Mantainer: Splith <spam at helper3000 net>
# Package version 0.4.1 commit: ba7c5e0209f74b1622e8dc57f3ccfe97863406c4

pkgname=mosquitto-php
pkgver=0.4.1
pkgrel=1
pkgdesc='MQTT (Mosquitto) PHP extension'
url='https://github.com/mgdm/Mosquitto-PHP'
license=('BSD')
arch=('any')
depends=('php' 'mosquitto')
makedepends=('php' 'mosquitto')
source=("git+https://github.com/mgdm/mosquitto-php.git")
backup=('etc/php/conf.d/mosquitto.ini')
sha256sums=('SKIP')

build() {
  cd $srcdir/mosquitto-php

  msg "Running phpize..."
  phpize
  ./configure --prefix=/usr --with-mosquitto=/usr/lib/libmosquitto.so

  msg "Building extension..."
  make
}

package() {
  cd $srcdir/mosquitto-php
  msg "Installing files..."
  mkdir -p "$pkgdir"/{/usr/lib/php/modules,/etc/php/conf.d}
  mkdir -p "$pkgdir"/usr/share/licenses/mosquitto-php

  echo "extension=mosquitto.so" > "mosquitto.ini"

  install -D -m755 modules/mosquitto.so ${pkgdir}/usr/lib/php/modules/mosquitto.so
  install -D -m644 mosquitto.ini ${pkgdir}/etc/php/conf.d/mosquitto.ini
  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/mosquitto-php/LICENSE
}
