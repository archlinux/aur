# Maintainer: Evangelos Foutras <foutrelis@gmail.com>

pkgname=php-memcache
pkgver=3.0.4
pkgrel=1
pkgdesc="Memcache module for PHP"
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/memcache"
license=('PHP')
depends=('php')
backup=('etc/php/conf.d/memcache.ini')
install=php-memcache.install
source=(http://pecl.php.net/get/memcache-$pkgver.tgz)
md5sums=('07933ce0191274201ea6905cd509c5b0')

build() {
  cd "$srcdir/memcache-$pkgver"

  phpize || return 1
  ./configure --prefix=/usr --enable-memcache
  make || return 1
  make INSTALL_ROOT="$pkgdir" install
  echo ';extension=memcache.so' > memcache.ini
  install -D -m644 memcache.ini "$pkgdir/etc/php/conf.d/memcache.ini"
}

# vim:set ts=2 sw=2 et:
