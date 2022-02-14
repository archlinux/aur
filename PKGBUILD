# Maintainer: Timo Sarawinski <timo@it-kraut.net> 

pkgname=php73-smbclient
_extname=smbclient
pkgver=1.0.6
pkgrel=1
pkgdesc="PHP bindings for libsmbclient."
arch=('i686' 'x86_64')
url="https://github.com/eduardok/libsmbclient-php"
license=('BSD')
depends=('php73' 'smbclient')
source=("php73-smbclient-${pkgver}.tar.gz::https://github.com/eduardok/libsmbclient-php/archive/${pkgver}.tar.gz")
md5sums=('dd00ec1431149a7e627b62d659fc4ad8')

build() {
  cd "libsmbclient-php-${pkgver}"

  phpize73
  ./configure --prefix=/usr --with-php-config=/usr/bin/php-config73
  make
}

package() {
  cd "libsmbclient-php-${pkgver}"

  make INSTALL_ROOT="${pkgdir}" install
  echo "extension=smbclient.so" > "${_extname}.ini"
  install -D -m644 "${_extname}.ini" "${pkgdir}/etc/php73/conf.d/${_extname}.ini"
}
