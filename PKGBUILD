# Contributor: Spencer Rinehart <anubis@overthemonkey.com>

_extname=wddx
pkgname=("php-${_extname}")
pkgver=5.6.6
pkgrel=2
pkgdesc="PHP extension for wddx"
arch=('i686' 'x86_64')
url='http://www.php.net/wddx'
license=('PHP')
depends=('php')
backup=("etc/php/conf.d/${_extname}.ini")
install="php-${_extname}.install"
source=("http://www.php.net/distributions/php-${pkgver}.tar.gz")
md5sums=('2baddcf979a0d4eb65434c4da3bd9cd3')

build() {
  cd "php-${pkgver}/ext/${_extname}"

  phpize
  ./configure --prefix=/usr
  make
}

package() {
  cd "php-${pkgver}/ext/${_extname}"

  make INSTALL_ROOT="${pkgdir}" install
  echo "extension=${_extname}.so" > "${_extname}.ini"
  install -D -m644 "${_extname}.ini" "${pkgdir}/etc/php/conf.d/${_extname}.ini"
}
