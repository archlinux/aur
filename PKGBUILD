# Contributor: Mladen Milinkovic <maxrd2@smoothware.net>
# Based on aur/php-imagick by Spencer Rinehart <anubis@overthemonkey.com>

pkgname=php56-imagick
_extname=imagick
pkgver=3.7.0
pkgrel=1
pkgdesc="PHP extension for IMagick"
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/${_extname}"
license=('PHP')
depends=('php56>=5.1.3' 'imagemagick>=6.2.4')
backup=("etc/php/conf.d/${_extname}.ini")
install="php-${_extname}.install"
source=("http://pecl.php.net/get/${_extname}-${pkgver}.tgz")
sha256sums=('5a364354109029d224bcbb2e82e15b248be9b641227f45e63425c06531792d3e')

build() {
  cd "${_extname}-${pkgver}"

  phpize56
  ./configure --prefix=/usr
  make
}

package() {
  cd "${_extname}-${pkgver}"

  make INSTALL_ROOT="${pkgdir}" install
  echo "extension=${_extname}.so" > "${_extname}.ini"
  install -D -m644 "${_extname}.ini" "${pkgdir}/etc/php56/conf.d/${_extname}.ini"
}
