# Maintainer: Dringsim <dringsim@qq.com>

pkgname=php-excimer
pkgver=1.2.5
pkgrel=1
pkgdesc="Extension for PHP 7.1+ that provides a low-overhead interrupting timer and sampling profiler"
arch=('x86_64')
license=('Apache')
url='https://www.mediawiki.org/wiki/Excimer'
depends=('php')
backup=('etc/php/conf.d/excimer.ini')
source=("$pkgname-$pkgver.tar.gz::https://github.com/wikimedia/mediawiki-php-excimer/archive/refs/tags/$pkgver.tar.gz")

build() {
  cd "php-excimer-$pkgver"

  phpize
  ./configure --prefix=/usr

  make
}

check() {
  cd "php-excimer-$pkgver"

  make test
}

package() {
  cd "php-excimer-$pkgver"

  make install INSTALL_ROOT="$pkgdir"

  install -dm0755 "$pkgdir/etc/php/conf.d"
  echo ';extension=excimer.so' > "$pkgdir/etc/php/conf.d/excimer.ini"
}
sha256sums=('988665656faade49f0ac3f65a9d26c8aedbcf5871a5a5a8ec6943ff42e704327')
