_phpbase=81
pkgname=php81-redis
pkgver=5.3.4
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
sha256sums=('4b39056f3356f135255e059efd76398d1c7607c86bd52513e6341bb07a3fb4cc')

build() {
  cd "$srcdir/redis-$pkgver"
  phpize${_phpbase}
  ./configure --prefix=/usr --enable-redis-lzf --with-php-config=php-config${_phpbase}
  make
}

package() {
  cd "$srcdir/redis-$pkgver"
  make INSTALL_ROOT="$pkgdir" install
  echo ';extension=redis.so' > redis.ini
  install -Dm644 redis.ini "$pkgdir/etc/php${_phpbase}/conf.d/redis.ini"
}
