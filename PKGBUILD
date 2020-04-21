# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=php-http
pkgver=3.2.3
pkgrel=1
pkgdesc="Aims to provide a convenient and powerful set of functionality for one of PHPs major applications"
arch=('i686' 'x86_64')
license=('BSD')
url=""https://mdref.m6w6.name/http
depends=('php' 'php-raphf' 'php-propro' 'brotli' 'libevent')
backup=('etc/php/conf.d/http.ini')
source=("https://pecl.php.net/get/pecl_http-${pkgver}.tgz")
sha512sums=('e955e3246db9a9172081dd9a077154139c585bfce546e91839052bbab4d0db9d0695122574a66891ceba5c0b7e8a8f0768274e1516521ccb95cd19504dc13666')

build() {
  cd "${srcdir}/pecl_http-${pkgver}"

  phpize
  ./configure --with-http-libidn2-dir=no
  make
}

package() {
  cd "${srcdir}/pecl_http-${pkgver}"

  make install INSTALL_ROOT="${pkgdir}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  echo "extension=http.so" > http.ini
  install -Dm644 "http.ini" "${pkgdir}/etc/php/conf.d/http.ini"
}
