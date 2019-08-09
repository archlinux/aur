_phpbase=php70
pkgname=php70-redis
pkgver=5.0.2
pkgrel=1
pkgdesc="PHP extension for interfacing with Redis"
url="http://pecl.php.net/package/redis"
arch=('x86_64')
license=('PHP')
makedepends=("${_phpbase}")
depends=("${_phpbase}")
conflicts=('phpredis-git' 'phpredis' 'php-redis')
backup=("etc/${_phpbase}/conf.d/redis.ini")
source=(
    http://pecl.php.net/get/redis-${pkgver}.tgz
)

build() {
  cd "$srcdir/redis-$pkgver"
  phpize70
  ./configure --prefix=/usr --enable-redis-lzf
  make
}

package() {
  cd "$srcdir/redis-$pkgver"
  make INSTALL_ROOT="$pkgdir" install
  echo ';extension=redis.so' > redis.ini
  install -Dm644 redis.ini "$pkgdir/etc/${_phpbase}/conf.d/redis.ini"
}
md5sums=('0fed05402f8eabc2030ae327df0d1e27')
