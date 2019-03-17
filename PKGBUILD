# Maintainer: Enrico Schmitz <es@mdtm.de>
# Maintainer: Kai Korla <balticer@balticer.de>
pkgname=php-redis
pkgver=4.3.0
pkgrel=1
pkgdesc="PHP extension for interfacing with Redis"
url="http://pecl.php.net/package/redis"
arch=('x86_64' 'armv7h')
license=('PHP')
makedepends=(
   'php>=7.0.0'
   'php-igbinary'
)
depends=(
    'php>=7.0.0'
    'php-igbinary'
)
backup=('etc/php/conf.d/redis.ini')

source=(
    http://pecl.php.net/get/redis-${pkgver}.tgz
)

sha256sums=('c0f04cec349960a842b60920fb8a433656e2e494eaed6e663397d67102a51ba2')

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
