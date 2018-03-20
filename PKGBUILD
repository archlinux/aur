# Maintainer: Alex "grevus" Lobtsov <alex@lobtsov.com>
# Maintainer: Kai Korla <balticer@balticer.de>
pkgname=php-redis
pkgver=4.0.0
pkgrel=1
pkgdesc="PHP extension for interfacing with Redis"
url="http://pecl.php.net/package/redis"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('PHP')
depends=(
    'php>=7.0.0'
)
conflicts=(
    'phpredis-git'
)
backup=('etc/php/conf.d/redis.ini')

source=(
    http://pecl.php.net/get/redis-${pkgver}.tgz
)

sha256sums=('c8a969cca131efa9e583c11e6522953a9165b804dbc5d2cba8875323ab22cfc1')

build() {
  cd "$srcdir/redis-$pkgver"

  phpize
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/redis-$pkgver"

  make INSTALL_ROOT="$pkgdir" install
  echo ';extension=redis.so' > redis.ini
  install -Dm644 redis.ini "$pkgdir/etc/php/conf.d/redis.ini"
}
