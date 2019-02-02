# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>

pkgname=php-geoip
pkgver=1.1.1
pkgrel=4
pkgdesc="GeoIP module for PHP"
arch=('x86_64')
url="https://pecl.php.net/package/geoip"
license=('PHP')
depends=('php' 'geoip')
makedepends=('subversion')
backup=('etc/php/conf.d/geoip.ini')
source=(https://pecl.php.net/get/geoip-$pkgver.tgz)
sha256sums=('b2d05c03019d46135c249b5a7fa0dbd43ca5ee98aea8ed807bc7aa90ac8c0f06')

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
