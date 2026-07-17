_phpbase=83
pkgname=php83-redis
pkgver=6.3.0
pkgrel=1
pkgdesc="PHP extension for interfacing with Redis"
url="http://pecl.php.net/package/redis"
arch=('x86_64')
license=('PHP')
makedepends=("php${_phpbase}" "liblzf")
depends=("php${_phpbase}" "liblzf")
backup=("etc/php${_phpbase}/conf.d/40-redis.ini")
source=(
    http://pecl.php.net/get/redis-${pkgver}.tgz
)
build() {
  cd "$srcdir/redis-$pkgver"
  phpize${_phpbase}
  ./configure --prefix=/usr \
    --enable-redis-lzf \
    --with-liblzf=/usr/lib/ \
    --with-php-config=php-config${_phpbase}
  make
}

package() {
  cd "$srcdir/redis-$pkgver"
  make INSTALL_ROOT="$pkgdir" install
  echo 'extension=redis.so' > redis.ini
  install -Dm644 redis.ini "$pkgdir/etc/php${_phpbase}/conf.d/40-redis.ini"
  rm redis.ini
}

sha256sums=('0d5141f634bd1db6c1ddcda053d25ecf2c4fc1c395430d534fd3f8d51dd7f0b5')
