# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=php-raphf
pkgver=2.0.0
pkgrel=2
pkgdesc="A reusable split-off of pecl_http's persistent handle and resource factory API"
arch=('i686' 'x86_64')
license=('BSD')
url="https://mdref.m6w6.name/raphf"
depends=('php')
backup=('etc/php/conf.d/raphf.ini')
source=("https://pecl.php.net/get/raphf-${pkgver}.tgz")
md5sums=('bc465eb5caa9d0f09cced121a8ac2e8e')

build() {
  cd "${srcdir}/raphf-${pkgver}"

  phpize
  ./configure
  make
}

package() {
  cd "${srcdir}/raphf-${pkgver}"

  make install INSTALL_ROOT="${pkgdir}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  echo "extension=raphf.so" > raphf.ini
  install -Dm644 "raphf.ini" "${pkgdir}/etc/php/conf.d/raphf.ini"
}
