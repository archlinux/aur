# Contributor: Spencer Rinehart <anubis@overthemonkey.com>

_extname=wddx
pkgname=("php-${_extname}")
pkgver=7.0.1
pkgrel=1
pkgdesc="PHP extension for wddx"
arch=('i686' 'x86_64')
url='http://www.php.net/wddx'
license=('PHP')
depends=('php')
backup=("etc/php/conf.d/${_extname}.ini")
install="php-${_extname}.install"
source=("http://www.php.net/distributions/php-${pkgver}.tar.gz")
md5sums=('2da2981724d5c99ab7dc6e2164c8e756')

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
