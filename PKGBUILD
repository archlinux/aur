# Maintainer: Alex "grevus" Lobtsov <alex@lobtsov.com>
# Maintainer: Kai Korla <balticer@balticer.de>
pkgname=php-redis-3
pkgver=3.1.6
pkgrel=1
pkgdesc="PHP extension for interfacing with Redis"
url="http://pecl.php.net/package/redis"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('PHP')
depends=(
    'php>=7.0.0'
)
conflicts=(
    'php-redis'
    'phpredis-git'
)
backup=('etc/php/conf.d/redis.ini')

source=(
    http://pecl.php.net/get/redis-${pkgver}.tgz
)

sha256sums=('b229274cdc14c22efc41fefa00db4dc5bb32a997d6811278662a043a76aa2600')

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
