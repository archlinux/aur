_phpbase=81
pkgname=php81-imagick
_extname=imagick
pkgver=3.6.0
pkgrel=1
pkgdesc="PHP extension for imagick php${_phpbase}"
arch=('x86_64')
url="https://pecl.php.net/package/${_extname}"
license=('PHP')
depends=("php${_phpbase}" 'imagemagick>=6.5.3')
backup=("etc/php${_phpbase}/conf.d/${_extname}.ini")
install="php-${_extname}.install"
source=("https://pecl.php.net/get/${_extname}-${pkgver}.tgz")
md5sums=('f7b5e9b23fb844e5eb035203d316bc63')

build() {
  cd "${_extname}-${pkgver}"
  phpize${_phpbase}
  ./configure --prefix=/usr --with-php-config=php-config${_phpbase}
  make
}

package() {
  cd "${_extname}-${pkgver}"
  make INSTALL_ROOT="${pkgdir}" install
  echo "extension=${_extname}.so" > "${_extname}.ini"
  install -D -m644 "${_extname}.ini" "${pkgdir}/etc/php${_phpbase}/conf.d/${_extname}.ini"
}
