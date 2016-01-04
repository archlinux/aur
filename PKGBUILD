# Maintainer: Patrick Burroughs (Celti) <celti@celti.name>
# Contributor: Alex "grevus" Lobtsov <alex@lobtsov.com>
pkgname=php-redis-git
pkgver=2.2.7.r364.g3c048f1
pkgrel=1
pkgdesc="PHP extension for interfacing with Redis (PHP7 branch)"
url="http://pecl.php.net/package/redis"
arch=('x86_64' 'i686')
license=('PHP')
depends=('php' 'redis')
makedepends=('git')
conflicts=('php-redis')
backup=('etc/php/conf.d/redis.ini')
source=('php-redis-git::git+https://github.com/phpredis/phpredis.git#branch=php7')
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"

  phpize
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname"

  make INSTALL_ROOT="$pkgdir" install
  echo ';extension=redis.so' > redis.ini
  install -Dm644 redis.ini "$pkgdir/etc/php/conf.d/redis.ini"
}
