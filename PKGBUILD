# Maintainer: Robin Appelman <robin@icewind.nl> 

pkgname=php-smbclient
_extname=smbclient
pkgver=1.0.0
pkgrel=1
pkgdesc="PHP bindings for libsmbclient."
arch=('i686' 'x86_64')
url="https://github.com/eduardok/libsmbclient-php"
license=('BSD')
depends=('php' 'smbclient')
backup=("etc/php/conf.d/${_extname}.ini")
source=("https://github.com/eduardok/libsmbclient-php/archive/${pkgver}.tar.gz")
md5sums=('c28d1d4cab164fb56626da00d7deb7b7')

build() {
  cd "libsmbclient-php-${pkgver}"

  phpize
  ./configure --prefix=/usr
  make
}

package() {
  cd "libsmbclient-php-${pkgver}"

  make INSTALL_ROOT="${pkgdir}" install
  echo "extension=smbclient.so" > "${_extname}.ini"
  install -D -m644 "${_extname}.ini" "${pkgdir}/etc/php/conf.d/${_extname}.ini"
}
