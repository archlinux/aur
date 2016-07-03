# Maintainer: Alex "grevus" Lobtsov <alex@lobtsov.com>
pkgname=php-redis
pkgver=3.0.0
pkgrel=1
pkgdesc="PHP extension for interfacing with Redis"
url="http://pecl.php.net/package/redis"
arch=('x86_64' 'i686')
license=('PHP')
depends=(
    'php'
    'redis'
)
conflicts=(
    'phpredis'
    'phpredis-git'
    'php-redis-git'
)
backup=('etc/php/conf.d/redis.ini')

source=(
    http://pecl.php.net/get/redis-${pkgver}.tgz
)

sha256sums=('de0e349027ea0821fbfb7f1961226223f3179bb84c6dada515f0145227993f70')

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
