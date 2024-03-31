_phpbase=70
pkgname=php${_phpbase}-redis
pkgver=6.0.2
pkgrel=1
pkgdesc="PHP 7.0 extension for interfacing with Redis"
url="http://pecl.php.net/package/redis"
arch=('x86_64')
license=('PHP')
makedepends=("php${_phpbase}" "liblzf")
depends=("php${_phpbase}")
backup=("etc/php${_phpbase}/conf.d/20-redis.ini")
source=(
    http://pecl.php.net/get/redis-${pkgver}.tgz
)

build() {
  cd "$srcdir/redis-$pkgver"
  phpize${_phpbase}
  ./configure --prefix=/usr --enable-redis-lzf --with-liblzf=/usr/lib/
  make
}

package() {
  cd "$srcdir/redis-$pkgver"
  make INSTALL_ROOT="$pkgdir" install
  echo 'extension=redis.so' > 20-redis.ini
  install -Dm644 20-redis.ini "$pkgdir/etc/php${_phpbase}/conf.d/20-redis.ini"
  rm 20-redis.ini
}
md5sums=('29f1f0ba367aef7e0313cd75aa1ea83f')
