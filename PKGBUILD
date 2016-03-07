# Maintainer: Daniel Milde <daniel at milde dot cz>
pkgname=pecl-http
pkgver=3.0.0
pkgrel=1
pkgdesc="Extended HTTP Support"
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/pecl_http"
license=('BSD')
depends=('php' 'pecl-raphf' 'pecl-propro')
makedepends=('autoconf')
source=(http://pecl.php.net/get/pecl_http-${pkgver}.tgz)
sha256sums=('710aaadf6cd0c93e1de21d77855c6b2f851e9fd41f84f1c508b113e5060a46df')
install=http.install

build() {
  cd ${srcdir}/pecl_http-${pkgver}
  phpize
  ./configure
  make
}

package() {
  cd ${srcdir}/pecl_http-${pkgver}
  make INSTALL_ROOT=${pkgdir} install
  install -d ${pkgdir}/etc/php/conf.d
  echo ";extension=http.so" > ${pkgdir}/etc/php/conf.d/http.ini
}
