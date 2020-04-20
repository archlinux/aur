_phpbase=72
pkgname=php72-imagick
_extname=imagick
pkgver=3.4.4
pkgrel=2
pkgdesc="PHP extension for IMagick"
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/${_extname}"
license=('PHP')
depends=("php${_phpbase}" 'imagemagick')
backup=("etc/php${_phpbase}/conf.d/${_extname}.ini")
install="php-${_extname}.install"
source=("http://pecl.php.net/get/${_extname}-${pkgver}.tgz")

build() {
  cd "${_extname}-${pkgver}"
  phpize${_phpbase}
  ./configure --prefix=/usr
  make
}

package() {
  cd "${_extname}-${pkgver}"

  make INSTALL_ROOT="${pkgdir}" install
  echo "extension=${_extname}.so" > "${_extname}.ini"
  install -D -m644 "${_extname}.ini" "${pkgdir}/etc/php${_phpbase}/conf.d/${_extname}.ini"
}
md5sums=('6d3a7048ab73b0fab931f28c484dbf76')
