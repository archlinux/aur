# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=php-http
pkgver=4.2.1
pkgrel=1
pkgdesc="Aims to provide a convenient and powerful set of functionality for one of PHPs major applications"
arch=('i686' 'x86_64')
license=('BSD')
url="https://mdref.m6w6.name/http"
depends=('php' 'php-raphf' 'brotli' 'libevent')
backup=('etc/php/conf.d/http.ini')
source=("https://pecl.php.net/get/pecl_http-${pkgver}.tgz")
sha512sums=('2ad7e57fae313a7b46ba88e528e124ac9d83804827131a6ef478ccf3cf5883dec2d928b8ceb377ee7f5947c76f24d640d77533a9946612419e526786a79877e6')

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
