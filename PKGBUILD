# Contributor: Spencer Rinehart <anubis@overthemonkey.com>
# Contributor: Marcel Pfeiffer <m.pfeiffer@strucnamics.de>
# Contributor: Piotr Walesiuk <pwalesiuk@gmail.com>

pkgname=php-oci8
_extname=oci8
pkgver=3.4.0
pkgrel=1
pkgdesc="PHP extension for OCI8"
arch=('x86_64')
url="https://pecl.php.net/package/${_extname}"
license=('PHP')
depends=('php>=8.3.0' 'oracle-instantclient-sdk')
backup=("etc/php/conf.d/${_extname}.ini")
source=("https://pecl.php.net/get/${_extname}-${pkgver}.tgz")
md5sums=('a40cf50e2b972028ccbb858e12a00b09')

build() {
  cd "${_extname}-${pkgver}"

  phpize
  ./configure --prefix=/usr --with-oci8=instantclient,/usr/lib
  make
}

package() {
  cd "${_extname}-${pkgver}"

  make INSTALL_ROOT="${pkgdir}" install
  echo "extension=${_extname}.so" > "${_extname}.ini"
  install -D -m644 "${_extname}.ini" "${pkgdir}/etc/php/conf.d/${_extname}.ini"
}

