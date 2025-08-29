# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=php-raphf
pkgver=2.0.2
pkgrel=1
pkgdesc="A reusable split-off of pecl_http's persistent handle and resource factory API"
arch=('x86_64')
license=('BSD-2-Clause')
url="https://mdref.m6w6.name/raphf"
depends=('php' 'glibc')
backup=('etc/php/conf.d/raphf.ini')
source=("https://pecl.php.net/get/raphf-${pkgver}.tgz")
sha512sums=('ca82e95bfaa9012de2c46334ff9095c8e214c108d58ed778c33541c9a39b53e2edc5539af1da075a11f025c209ea6cd1439f902be12f5726fb9fbc7c194e30b2')

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
