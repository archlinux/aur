# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=php-http
pkgver=3.1.0
pkgrel=1
pkgdesc="Aims to provide a convenient and powerful set of functionality for one of PHPs major applications"
arch=('i686' 'x86_64')
license=('BSD')
url=""https://mdref.m6w6.name/http
depends=('php' 'php-raphf' 'php-propro')
backup=('etc/php/conf.d/http.ini')
source=("https://pecl.php.net/get/pecl_http-${pkgver}.tgz")
md5sums=('42485c5e9c65224c92e0da49721c053b')

build() {
  cd "${srcdir}/pecl_http-${pkgver}"

  phpize
  ./configure
  make
}

package() {
  cd "${srcdir}/pecl_http-${pkgver}"

  make install INSTALL_ROOT="${pkgdir}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  echo "extension=http.so" > http.ini
  install -Dm644 "http.ini" "${pkgdir}/etc/php/conf.d/http.ini"
}
