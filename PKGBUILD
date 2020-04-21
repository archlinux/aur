# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=php-raphf
pkgver=2.0.1
pkgrel=1
pkgdesc="A reusable split-off of pecl_http's persistent handle and resource factory API"
arch=('i686' 'x86_64')
license=('BSD')
url="https://mdref.m6w6.name/raphf"
depends=('php')
backup=('etc/php/conf.d/raphf.ini')
source=("https://pecl.php.net/get/raphf-${pkgver}.tgz")
sha512sums=('0a609fc21a62880963e7afb75297eb75a2598aab2c816cb61e84d665b0453e4952aa9bf25fe2c818cc94492a4b94aed965053c67899fdb984d88661364fffb1e')

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
