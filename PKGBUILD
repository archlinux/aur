# Maintainer: Timo Sarawinski <timo@it-kraut.net>

pkgname=php73-memcached
_pkgname=php-memcached
pkgver=3.1.5
pkgrel=1
pkgdesc="PHP extension for interfacing with memcached via libmemcached library"
arch=('x86_64')
url="https://github.com/php-memcached-dev/php-memcached"
license=('PHP')
depends=('php73' 'libmemcached')
makedepends=('git')
backup=('etc/php73/conf.d/memcached.ini')
source=("git+https://github.com/php-memcached-dev/php-memcached.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$_pkgname"

  phpize73
  ./configure --prefix=/usr 
  make
}

package() {
  cd "$srcdir/$_pkgname"

  make INSTALL_ROOT="$pkgdir" install

  install -d "$pkgdir/etc/php73/conf.d"
  echo ';extension=memcached.so' >"$pkgdir/etc/php73/conf.d/memcached.ini"
}

# vim:set ts=2 sw=2 et:
