# Contributor: Daniel Milde <info@milde.cz>
pkgname=pecl-http
pkgver=2.5.0
pkgrel=1
pkgdesc="Extended HTTP Support"
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/pecl_http"
license=('BSD')
depends=('php' 'pecl-raphf' 'pecl-propro')
makedepends=('autoconf')
source=(http://pecl.php.net/get/pecl_http-${pkgver}.tgz)
md5sums=('367302919d7c1c86792581ba8ccbdac7')
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
