_phpbase=php70
pkgname=php70-redis
pkgver=4.0.2
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
sha256sums=('36fa980831091efca6586fa347283f79587293aa93c7d42e948e6137bfd90ac8')

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
