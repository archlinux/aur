 
# Maintainer: Robin Appelman <robin@icewind.nl>

pkgname=php-smbclient-git
_extname=smbclient
pkgver=0.8.0.rc1.r9.g46b93b8
pkgver() {
  cd "libsmbclient-php"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
pkgrel=1
pkgdesc="PHP bindings for libsmbclient."
arch=('i686' 'x86_64')
url="https://github.com/eduardok/libsmbclient-php"
license=('BSD')
depends=('php' 'smbclient')
conflicts=('php-smbclient')
provides=('php-smbclient')
backup=("etc/php/conf.d/${_extname}.ini")
source=("git+https://github.com/eduardok/libsmbclient-php.git")
md5sums=('SKIP')

build() {
  cd "libsmbclient-php"

  phpize
  ./configure --prefix=/usr
  make
}

package() {
  cd "libsmbclient-php"

  make INSTALL_ROOT="${pkgdir}" install
  echo "extension=smbclient.so" > "${_extname}.ini"
  install -D -m644 "${_extname}.ini" "${pkgdir}/etc/php/conf.d/${_extname}.ini"
}