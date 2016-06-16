# Contributor: Spencer Rinehart <anubis@overthemonkey.com>

pkgname=php-gnupg
_extname=gnupg
pkgver=1.4.0RC1
pkgrel=1
pkgdesc="PHP extension for gnupg/gpgme."
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/${_extname}"
license=('BSD')
depends=('php>=5.1.3' 'gpgme')
backup=("etc/php/conf.d/${_extname}.ini")
install="php-${_extname}.install"
source=("http://pecl.php.net/get/${_extname}-${pkgver}.tgz")
md5sums=('cd3a2fdd6685bb132c95aa3c6b16bf59')

build() {
  cd "${_extname}-${pkgver}"

  phpize
  ./configure --prefix=/usr
  make
}

package() {
  cd "${_extname}-${pkgver}"

  make INSTALL_ROOT="${pkgdir}" install
  echo "extension=${_extname}.so" > "${_extname}.ini"
  install -D -m644 "${_extname}.ini" "${pkgdir}/etc/php/conf.d/${_extname}.ini"
}
