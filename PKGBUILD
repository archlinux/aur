# Maintainer: Dringsim <dringsim@qq.com>

pkgname=php-excimer
pkgver=1.2.3
pkgrel=1
pkgdesc="Extension for PHP 7.1+ that provides a low-overhead interrupting timer and sampling profiler"
arch=('x86_64')
license=('Apache')
url='https://www.mediawiki.org/wiki/Excimer'
depends=('php')
backup=('etc/php/conf.d/excimer.ini')
source=("$pkgname-$pkgver.tar.gz::https://github.com/wikimedia/mediawiki-php-excimer/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('B672D2B056432B3348AAEEB6112CE8C8583F612C02FC6AA38DA65C915F87640D')

build() {
  cd "mediawiki-php-excimer-$pkgver"

  phpize
  ./configure --prefix=/usr

  make
}

check() {
  cd "mediawiki-php-excimer-$pkgver"

  make test
}

package() {
  cd "mediawiki-php-excimer-$pkgver"

  make install INSTALL_ROOT="$pkgdir"

  install -dm0755 "$pkgdir/etc/php/conf.d"
  echo ';extension=excimer.so' > "$pkgdir/etc/php/conf.d/excimer.ini"
}
