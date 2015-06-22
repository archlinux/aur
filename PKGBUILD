# Maintainer: Alex "grevus" Lobtsov <alex@lobtsov.com>
pkgname=php-redis
pkgver=2.2.7
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
)
backup=('etc/php/conf.d/redis.ini')

source=(
    http://pecl.php.net/get/redis-${pkgver}.tgz
)

sha256sums=('95e5331cd7e709771eb4479c455bcf326a74b2aea3b1a5cba00b4c95e66dc902')

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
