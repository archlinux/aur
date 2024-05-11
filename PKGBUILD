# Maintainer: Dringsim <dringsim@qq.com>

pkgname=php-excimer
pkgver=1.2.1
pkgrel=2
pkgdesc="Extension for PHP 7.1+ that provides a low-overhead interrupting timer and sampling profiler"
arch=('x86_64')
license=('Apache')
url='https://www.mediawiki.org/wiki/Excimer'
depends=('php')
backup=('etc/php/conf.d/excimer.ini')
source=("$pkgname-$pkgver.tar.gz::https://github.com/wikimedia/mediawiki-php-excimer/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('67640A1C52A0F474FD5F85528223ADBC6FECCFD743540EF380E624E07424307C')

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
