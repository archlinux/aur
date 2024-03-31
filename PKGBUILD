_phpbase=81
pkgname=php81-redis
pkgver=6.0.2
pkgrel=1
pkgdesc="PHP extension for interfacing with Redis"
url="http://pecl.php.net/package/redis"
arch=('x86_64')
license=('PHP')
makedepends=("php${_phpbase}")
depends=("php${_phpbase}")
backup=("etc/php${_phpbase}/conf.d/redis.ini")
source=(
    http://pecl.php.net/get/redis-${pkgver}.tgz
)
build() {
  cd "$srcdir/redis-$pkgver"
  phpize${_phpbase}
  ./configure --prefix=/usr --enable-redis-lzf --with-php-config=php-config${_phpbase}
  make
}

package() {
  cd "$srcdir/redis-$pkgver"
  make INSTALL_ROOT="$pkgdir" install
  echo 'extension=redis.so' > redis.ini
  install -Dm644 redis.ini "$pkgdir/etc/php${_phpbase}/conf.d/20-redis.ini"
  rm redis.ini
}

sha256sums=('01aeccb0e14f897fe56f0509be6e6991ff0ad459f9d34e95e4556d02699b9a03')

