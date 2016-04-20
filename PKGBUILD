# Contributor: Spencer Rinehart <anubis@overthemonkey.com>

pkgname=php-oci8
_extname=oci8
pkgver=2.1.1
pkgrel=1
pkgdesc="PHP extension for OCI8"
arch=('x86_64')
url="http://pecl.php.net/package/${_extname}"
license=('PHP')
depends=('php>=7.0.0' 'oracle-instantclient-sdk')
backup=("etc/php/conf.d/${_extname}.ini")
source=("http://pecl.php.net/get/${_extname}-${pkgver}.tgz")
md5sums=('01bb3429ce3206dcc3d3198e65dadfbc')

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
