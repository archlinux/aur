_phpbase=72
pkgname=php${_phpbase}-redis
pkgver=5.3.7
pkgrel=1
pkgdesc="PHP extension for interfacing with Redis"
url="http://pecl.php.net/package/redis"
arch=('x86_64')
license=('PHP')
makedepends=("php${_phpbase}" "liblzf")
depends=("php${_phpbase}")
backup=("etc/php${_phpbase}/conf.d/20-redis.ini")
source=("http://pecl.php.net/get/redis-${pkgver}.tgz")

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
  echo 'extension=redis.so' > 20-redis.ini
  install -Dm644 20-redis.ini "$pkgdir/etc/php${_phpbase}/conf.d/20-redis.ini"
}

md5sums=('1ed6793902214cc02467666ba69dd2be')
