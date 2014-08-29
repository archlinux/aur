# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>

pkgname=php-geoip
pkgver=1.1.0
pkgrel=1
pkgdesc="GeoIP module for PHP"
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/geoip"
license=('PHP')
depends=('php' 'geoip')
backup=('etc/php/conf.d/geoip.ini')
source=(http://pecl.php.net/get/geoip-$pkgver.tgz)
sha256sums=('82c6deb7264d2ff7c4d6c45a7d27cff7ab097be965795e317e04a9c5b7be98b9')

build() {
  cd "$srcdir/geoip-$pkgver"

  phpize
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/geoip-$pkgver"

  make INSTALL_ROOT="$pkgdir" install
  echo ';extension=geoip.so' >geoip.ini
  install -Dm644 geoip.ini "$pkgdir/etc/php/conf.d/geoip.ini"
}

# vim:set ts=2 sw=2 et:
