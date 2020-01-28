# Maintainer: Mark Weiman

pkgname=php-alpm
_extname=alpm
pkgver=0.6
pkgrel=1
pkgdesc="A PHP extension to use Arch Linux's ALPM"
arch=('i686' 'x86_64')
url="https://github.com/markzz/php-alpm"
makedepends=('php>=7.0')
license=('LGPL2.1')
install="${pkgname}.install"
source=("php-alpm-${pkgver}.tar.gz::https://github.com/markzz/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('dd38782809803040555a445ec856a1c0')

build() {
  cd "${pkgname}-${pkgver}"

  phpize
  ./configure --with-php-config=/usr/bin/php-config --prefix=/usr
  make
}

package_php-alpm() {
  depends=("php" "pacman>=5.0")
  cd "${pkgname}-${pkgver}"
  make INSTALL_ROOT="${pkgdir}" install
  echo "extension=${_extname}.so" > "${_extname}.ini"
  install -D -m644 "${_extname}.ini" "${pkgdir}/etc/php/conf.d/${_extname}.ini"
}
