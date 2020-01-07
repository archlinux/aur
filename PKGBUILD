# Maintainer: Daniel Milde <daniel at milde dot cz>
pkgname=pecl-http
pkgver=3.2.3
pkgrel=1
pkgdesc="Extended HTTP Support"
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/pecl_http"
license=('BSD')
depends=('php' 'pecl-raphf' 'pecl-propro')
makedepends=('autoconf')
source=(http://pecl.php.net/get/pecl_http-${pkgver}.tgz)
sha256sums=('cf9d2a2ed335e572366025eca1d69e86c585f96ca07db341839a06f52ee4aa88')
install=http.install

build() {
  cd ${srcdir}/pecl_http-${pkgver}
  phpize
  ./configure --without-http-libidn-dir
  make
}

package() {
  cd ${srcdir}/pecl_http-${pkgver}
  make INSTALL_ROOT=${pkgdir} install
  install -d ${pkgdir}/etc/php/conf.d
  echo ";extension=http.so" > ${pkgdir}/etc/php/conf.d/3-http.ini
}
