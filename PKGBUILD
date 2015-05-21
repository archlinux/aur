pkgname=php-pecl-oauth
pkgver=1.2.3
pkgrel=2
pkgdesc="PHP oauth consumer/provider extension"
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/oauth"
license=('BSD')
depends=('php>=5.3.2')
backup=('etc/php/conf.d/oauth.ini')
install=php-pecl-oauth.install
source=(http://pecl.php.net/get/oauth-$pkgver.tgz)
md5sums=('99838d9a04b78058c7360dfd69c8593b')

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
