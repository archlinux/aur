# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=php-http
pkgver=4.2.6
pkgrel=1
pkgdesc="Aims to provide a convenient and powerful set of functionality for one of PHPs major applications"
arch=('x86_64')
license=('BSD-2-Clause')
url="https://mdref.m6w6.name/http"
depends=('glibc' 'curl' 'brotli' 'libevent' 'icu' 'libidn2' 'openssl' 'zlib'
         'php' 'php-raphf')
backup=('etc/php/conf.d/http.ini')
source=("https://pecl.php.net/get/pecl_http-${pkgver}.tgz")
sha512sums=('50c921d11e035281bd55152e449ee47d203c839d654b097fcbc5d6d93faf91a6111817b8a7157715de0af9f15c713974a53a2ab318eddd840bc3a7e6b2b50e11')

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
