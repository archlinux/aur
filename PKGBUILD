# Maintainer: Tomasz Gruszka <tompear79@gmail.com>
# Contributor: Timo Sarawinski <timo@it-kraut.net>

pkgname=php74-memcached
_pkgname=php-memcached
pkgver=3.1.5
pkgrel=1
pkgdesc="PHP extension for interfacing with memcached via libmemcached library"
arch=('x86_64')
url="https://github.com/php-memcached-dev/php-memcached"
license=('PHP')
depends=('php74' 'libmemcached')
makedepends=('git')
backup=('etc/php74/conf.d/memcached.ini')
source=("git+https://github.com/php-memcached-dev/php-memcached.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$_pkgname"

  phpize74
  ./configure --prefix=/usr --with-php-config=/usr/bin/php-config74
  make
}

package() {
  cd "$srcdir/$_pkgname"

  make INSTALL_ROOT="$pkgdir" install

  install -d "$pkgdir/etc/php74/conf.d"
  echo ';extension=memcached.so' >"$pkgdir/etc/php74/conf.d/memcached.ini"
}

# vim:set ts=2 sw=2 et:
