_phpbase=81
pkgname=php81-imagick
_extname=imagick
pkgver=3.7.0
pkgrel=2
pkgdesc="PHP extension for imagick php${_phpbase}"
arch=('x86_64')
url="https://pecl.php.net/package/${_extname}"
license=('PHP')
depends=("php${_phpbase}" 'imagemagick>=6.5.3')
backup=("etc/php${_phpbase}/conf.d/20-${_extname}.ini")
source=("https://pecl.php.net/get/${_extname}-${pkgver}.tgz")
md5sums=('0687774a6126467d4e5ede02171e981d')

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
  install -D -m644 "${_extname}.ini" "${pkgdir}/etc/php${_phpbase}/conf.d/20-${_extname}.ini"
}
