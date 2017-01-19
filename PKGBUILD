# Contributor: Spencer Rinehart <anubis@overthemonkey.com>

pkgname=php-imagick
_extname=imagick
pkgver=3.4.3RC2
pkgrel=1
pkgdesc="PHP extension for IMagick"
arch=('i686' 'x86_64')
url="https://pecl.php.net/package/${_extname}"
license=('PHP')
depends=('php>=5.4.0' 'imagemagick>=6.5.3')
backup=("etc/php/conf.d/${_extname}.ini")
install="php-${_extname}.install"
source=("https://pecl.php.net/get/${_extname}-${pkgver}.tgz")
md5sums=('d488ccdedbf8077e690548dd27acf820')

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
