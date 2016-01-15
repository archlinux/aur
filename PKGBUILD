pkgname=php-pecl-oauth
pkgver=2.0.0
pkgrel=1
pkgdesc="PHP oauth consumer/provider extension"
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/oauth"
license=('BSD')
depends=('php>=5.3.2')
backup=('etc/php/conf.d/oauth.ini')
install=php-pecl-oauth.install
source=(http://pecl.php.net/get/oauth-$pkgver.tgz)
md5sums=('48d0cd5fcba4c6cf7d8ef346c50498c1')

build() {
  cd "oauth-$pkgver"
  phpize
  ./configure --prefix=/usr
  make
}

package() {
  cd "oauth-$pkgver"
  make INSTALL_ROOT="$pkgdir" install
  echo ';extension=oauth.so' > oauth.ini
  install -Dm644 oauth.ini "$pkgdir/etc/php/conf.d/oauth.ini"
}
