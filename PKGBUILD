# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=php-http
pkgver=4.2.4
pkgrel=1
pkgdesc="Aims to provide a convenient and powerful set of functionality for one of PHPs major applications"
arch=('i686' 'x86_64')
license=('BSD')
url="https://mdref.m6w6.name/http"
depends=('php' 'php-raphf' 'brotli' 'libevent')
backup=('etc/php/conf.d/http.ini')
source=("https://pecl.php.net/get/pecl_http-${pkgver}.tgz")
sha512sums=('b1eb43a458f89b3fd384244bddc8f9d470f82d3162411df3070bf0adf0c3e0457bc1ce928c05e8fffe836fb52cbe4c88f733466a867c3f6320288c5051007b20')

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
