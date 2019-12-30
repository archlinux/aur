# Maintainer: Tomasz Gruszka <tompear79@gmail.com>
_phpversion=73
pkgname=php${_phpversion}-geoip
pkgver=1.1.1
pkgrel=1
pkgdesc="GeoIP module for PHP"
arch=('x86_64')
url="https://pecl.php.net/package/geoip"
license=('PHP')
depends=('php73' 'geoip')
backup=('etc/php${_phpversion}/conf.d/geoip.ini')
source=(https://pecl.php.net/get/geoip-$pkgver.tgz)
sha256sums=('b2d05c03019d46135c249b5a7fa0dbd43ca5ee98aea8ed807bc7aa90ac8c0f06')

build() {
  cd "$srcdir/geoip-$pkgver"

  phpize${_phpversion}
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/geoip-$pkgver"

  make INSTALL_ROOT="$pkgdir" install
  echo ';extension=geoip.so' > geoip.ini
  install -Dm644 geoip.ini "${pkgdir}/etc/php${_phpversion}/conf.d/geoip.ini"
}
