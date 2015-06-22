# Maintainer: Alex "grevus" Lobtsov <alex@lobtsov.com>
pkgname=php-gearman
pkgver=1.1.2
pkgrel=2
pkgdesc="PHP wrapper to libgearman"
url="http://pecl.php.net/package/gearman"
arch=('x86_64' 'i686')
license=('PHP')
depends=('php' 'gearman')
backup=('etc/php/conf.d/gearman.ini')

source=(
    http://pecl.php.net/get/gearman-${pkgver}.tgz
)

sha256sums=('c30a68145b4e33f4da929267f7b5296376ca81d76dd801fc77a261696a8a5965')

build() {
  cd "$srcdir/gearman-$pkgver"

  phpize
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/gearman-$pkgver"

  make INSTALL_ROOT="$pkgdir" install
  echo ';extension=gearman.so' > gearman.ini
  install -Dm644 gearman.ini "$pkgdir/etc/php/conf.d/gearman.ini"
}
