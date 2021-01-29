# Contributor: Christoph Bayer <chrbayer@criby.de>

pkgname=php7-gnupg
_extname=gnupg
pkgver=1.4.0
pkgrel=1
pkgdesc="PHP extension for gnupg/gpgme."
arch=('i686' 'x86_64')
url="https://pecl.php.net/package/${_extname}"
license=('BSD')
depends=('php7' 'gpgme')
backup=("etc/php7/conf.d/${_extname}.ini")
install="php-${_extname}.install"
source=("https://pecl.php.net/get/${_extname}-${pkgver}.tgz")
md5sums=('2354cb56168d8ea0f643e548e139d013')

build() {
  cd "${_extname}-${pkgver}"

  phpize7
  ./configure --prefix=/usr
  make
}

package() {
  cd "${_extname}-${pkgver}"

  make INSTALL_ROOT="${pkgdir}" install
  echo "extension=${_extname}.so" > "${_extname}.ini"
  install -D -m644 "${_extname}.ini" "${pkgdir}/etc/php7/conf.d/${_extname}.ini"
}
