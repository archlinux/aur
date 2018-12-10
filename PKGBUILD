# Maintainer: Alex "grevus" Lobtsov <alex@lobtsov.com>
# Maintainer: Kai Korla <balticer@balticer.de>
pkgname=php-redis
pkgver=4.2.0
pkgrel=1
pkgdesc="PHP extension for interfacing with Redis"
url="http://pecl.php.net/package/redis"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('PHP')
makedepends=(
   'php>=7.0.0'
   'php-igbinary'
)
depends=(
    'php>=7.0.0'
    'php-igbinary'
)
conflicts=(
    'phpredis-git'
)
backup=('etc/php/conf.d/redis.ini')

source=(
    http://pecl.php.net/get/redis-${pkgver}.tgz
)

sha256sums=('7655d88addda89814ad2131e093662e1d88a8c010a34d83ece5b9ff45d16b380')

build() {
  cd "$srcdir/redis-$pkgver"

  phpize
  ./configure --prefix=/usr --enable-redis-igbinary --enable-redis-lzf
  make
}

package() {
  cd "$srcdir/redis-$pkgver"

  make INSTALL_ROOT="$pkgdir" install
  echo ';extension=redis.so' > redis.ini
  install -Dm644 redis.ini "$pkgdir/etc/php/conf.d/redis.ini"
}
