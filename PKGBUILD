# Maintainer: Alex "grevus" Lobtsov <alex@lobtsov.com>
pkgname=php-redis
pkgver=3.1.4
pkgrel=1
pkgdesc="PHP extension for interfacing with Redis"
url="http://pecl.php.net/package/redis"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('PHP')
depends=(
    'php>=7.0.0'
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

sha256sums=('adebdfd52e8227a4da5d381d325b6eaccd29fd233bcc1b877517b9e8706ef265')

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
