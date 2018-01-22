# Maintainer: Jérôme Groven <jerome.groven [at] gmail [dot] com>

pkgname=php70-imagick
_extname=imagick
pkgver=3.4.3
pkgrel=1
pkgdesc="PHP extension for IMagick"
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/${_extname}"
license=('PHP')
depends=('php70>=7.0.26-1' 'imagemagick>=6.2.4')
backup=("etc/php/conf.d/${_extname}.ini")
install="php-${_extname}.install"
source=("http://pecl.php.net/get/${_extname}-${pkgver}.tgz")
md5sums=('d0ee25c007cd2a28cefccc0b9ee63a28')

build() {
  cd "${_extname}-${pkgver}"

  phpize70
  ./configure --prefix=/usr
  make
}

package() {
  cd "${_extname}-${pkgver}"

  make INSTALL_ROOT="${pkgdir}" install
  echo "extension=${_extname}.so" > "${_extname}.ini"
  install -D -m644 "${_extname}.ini" "${pkgdir}/etc/php70/conf.d/${_extname}.ini"
}
