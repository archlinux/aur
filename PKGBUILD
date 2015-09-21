 
# Contributor: Spencer Rinehart <anubis@overthemonkey.com>

pkgname=php-smbclient
_extname=smbclient
pkgver=0.7.0
pkgrel=1
pkgdesc="PHP bindings for libsmbclient."
arch=('i686' 'x86_64')
url="https://github.com/eduardok/libsmbclient-php"
license=('BSD')
depends=('php' 'smbclient')
backup=("etc/php/conf.d/${_extname}.ini")
source=("https://github.com/eduardok/libsmbclient-php/archive/${pkgver}.tar.gz")
md5sums=('8705287d0107678e215babffcff31bdd')

build() {
  cd "libsmbclient-php-${pkgver}"

  phpize
  ./configure --prefix=/usr
  make
}

package() {
  cd "libsmbclient-php-${pkgver}"

  make INSTALL_ROOT="${pkgdir}" install
  echo "extension=libsmbclient.so" > "${_extname}.ini"
  install -D -m644 "${_extname}.ini" "${pkgdir}/etc/php/conf.d/${_extname}.ini"
}