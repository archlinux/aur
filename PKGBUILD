pkgname=php-pecl-oauth
pkgver=2.0.1
pkgrel=1
pkgdesc="PHP oauth consumer/provider extension"
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/oauth"
license=('BSD')
depends=('php>=5.3.2')
backup=('etc/php/conf.d/oauth.ini')
install=php-pecl-oauth.install
source=("http://pecl.php.net/get/oauth-${pkgver}.tgz")
md5sums=('d8fb8bc415f1ccef01c728d45f8bd4fa')

build() {
  cd "${srcdir}/oauth-${pkgver}"

  phpize
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/oauth-${pkgver}"
  
  make INSTALL_ROOT="${pkgdir}" install
  echo ';extension=oauth.so' > oauth.ini

  install -Dm644 "oauth.ini" "${pkgdir}/etc/php/conf.d/oauth.ini"
  install -Dm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
