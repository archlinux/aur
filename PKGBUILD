# Maintainer: Thore Bödecker <me [at] foxxx0 [dot] de>

pkgname=php56-memcached
_pkgbase="${pkgname#php56-}"
_phpbase="${pkgname#-memcached}"
pkgver=2.2.0
pkgrel=2
pkgdesc="php56 extension for interfacing with memcached via libmemcached library"
arch=('i686' 'x86_64')
url="https://pecl.php.net/package/memcached"
license=('PHP')
provides=("php-memcached=${pkgver}-${pkgrel}")
depends=('php56>=5.6.17-3' 'libmemcached')
backup=('etc/php56/conf.d/memcached.ini')
install=php56-memcached.install
source=("https://pecl.php.net/get/memcached-${pkgver}.tgz")
md5sums=('28937c6144f734e000c6300242f44ce6')

build() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"

  phpize56
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"

  make INSTALL_ROOT="$pkgdir" install

  install -d "$pkgdir/etc/php56/conf.d"
  echo ';extension=memcached.so' >"$pkgdir/etc/php56/conf.d/memcached.ini"
}

# vim:set ts=2 sw=2 et:
