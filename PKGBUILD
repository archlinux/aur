# Maintainer: Daniel Milde <daniel at milde dot cz>
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
sha256sums=('068fff6dcf161a91c9abff6f70a924e540e44d63e5224f5c1191b8c89b7ddc89')
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
