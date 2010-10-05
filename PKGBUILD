# Maintainer: Evangelos Foutras <foutrelis@gmail.com>

pkgname=php-memcache
pkgver=3.0.5
pkgrel=1
pkgdesc="Memcache module for PHP"
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/memcache"
license=('PHP')
depends=('php')
backup=('etc/php/conf.d/memcache.ini')
install=php-memcache.install
source=(http://pecl.php.net/get/memcache-$pkgver.tgz)
md5sums=('2c7429a2d6b861a9d4ed0b9ad3cf0231')

build() {
  cd "$srcdir/memcache-$pkgver"

  phpize
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/memcache-$pkgver"

  make INSTALL_ROOT="$pkgdir" install
  echo ';extension=memcache.so' >memcache.ini
  install -Dm644 memcache.ini "$pkgdir/etc/php/conf.d/memcache.ini"
}

# vim:set ts=2 sw=2 et:
