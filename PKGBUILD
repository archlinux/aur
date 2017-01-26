# Maintainer: Thore Bödecker <me [at] foxxx0 [dot] de>

pkgname=php56-memcache
_pkgbase="${pkgname#php56-}"
_phpbase="${pkgname#-memcache}"
pkgver=3.0.8
pkgrel=3
pkgdesc="Memcache module for php56"
arch=('i686' 'x86_64')
url="https://pecl.php.net/package/memcache"
license=('PHP')
provides=("php-memcache=${pkgver}-${pkgrel}")
depends=('php56>=5.6.17-3')
checkdepends=('memcached')
CFLAGS+=' -std=gnu89'
backup=('etc/php56/conf.d/memcache.ini')
install=php56-memcache.install
source=(https://pecl.php.net/get/memcache-${pkgver}.tgz)
md5sums=('24505e9b263d2c77f8ae5e9b4725e7d1')

build() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"

  phpize56
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"

  make INSTALL_ROOT="$pkgdir" install
  echo ';extension=memcache.so' >memcache.ini
  install -Dm644 memcache.ini "$pkgdir/etc/php56/conf.d/memcache.ini"
}

# vim:set ts=2 sw=2 et:
