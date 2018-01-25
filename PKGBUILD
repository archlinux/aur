# Maintainer: Daniel Milde <daniel at milde dot cz>
pkgname=pecl-http
pkgver=3.1.0
pkgrel=1
pkgdesc="Extended HTTP Support"
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/pecl_http"
license=('BSD')
depends=('php' 'pecl-raphf' 'pecl-propro')
makedepends=('autoconf')
source=(http://pecl.php.net/get/pecl_http-${pkgver}.tgz)
sha256sums=('e3de67b156e7d5f6c2e5eb1e2b5f0acceb7004f1260d68c9f8b2c0f9629aabf0')
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
