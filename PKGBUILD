# Maintainer: Jeremy Kescher <jeremy@kescher.at> 

pkgname=php7-smbclient
_extname=smbclient
pkgver=1.0.4
pkgrel=2
pkgdesc="PHP bindings for libsmbclient (for php7)."
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/eduardok/libsmbclient-php"
license=('BSD')
depends=('php7' 'smbclient')
backup=("etc/php7/conf.d/${_extname}.ini")
source=("https://github.com/eduardok/libsmbclient-php/archive/${pkgver}.tar.gz")
md5sums=('10a0614a393650cac41724cda327d460')

build() {
  cd "libsmbclient-php-${pkgver}"

  phpize7
  ./configure --prefix=/usr
  make
}

package() {
  cd "libsmbclient-php-${pkgver}"

  make INSTALL_ROOT="${pkgdir}" install
  echo "extension=smbclient.so" > "${_extname}.ini"
  install -D -m644 "${_extname}.ini" "${pkgdir}/etc/php7/conf.d/${_extname}.ini"
}
