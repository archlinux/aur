# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>

pkgname=php-memcache
pkgver=3.0.6
pkgrel=2
pkgdesc="Memcache module for PHP"
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/memcache"
license=('PHP')
depends=('php')
backup=('etc/php/conf.d/memcache.ini')
install=php-memcache.install
source=(http://pecl.php.net/get/memcache-$pkgver.tgz)
sha256sums=('cf6871f0944ee38022c5f84910f306d83b0f51564bbc08624a215e06d8486618')

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
