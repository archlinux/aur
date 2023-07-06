# Maintainer: Timo Sarawinski <timo@it-kraut.net>

pkgname=php80-memcached
_pkgname=php-memcached
pkgver=3.2.0
pkgrel=1
pkgdesc="PHP extension for interfacing with memcached via libmemcached library"
arch=('x86_64')
url="https://github.com/php-memcached-dev/php-memcached"
license=('PHP')
depends=('php80' 'libmemcached')
makedepends=('git' 'php80-cli')
backup=('etc/php80/conf.d/memcached.ini')
source=("git+https://github.com/php-memcached-dev/php-memcached.git")
sha256sums=('SKIP')


build() {
  cd "$srcdir/$_pkgname"

  phpize80
  ./configure --prefix=/usr --with-php-config=/usr/bin/php-config80
  make
}

package() {
  cd "$srcdir/$_pkgname"

  make INSTALL_ROOT="$pkgdir" install

  install -d "$pkgdir/etc/php80/conf.d"
  echo ';extension=memcached.so' >"$pkgdir/etc/php80/conf.d/memcached.ini"
}

# vim:set ts=2 sw=2 et:
