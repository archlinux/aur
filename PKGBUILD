# Maintainer: Tomasz Gruszka <tompear79@gmail.com>
# Contributor: Timo Sarawinski <timo@it-kraut.net>

_phpversion=74
pkgname=php${_phpversion}-smbclient
_extname=smbclient
pkgver=1.0.6
pkgrel=1
pkgdesc="PHP 7.4 bindings for libsmbclient."
arch=('i686' 'x86_64')
url="https://github.com/eduardok/libsmbclient-php"
license=('BSD')
depends=("php${_phpversion}" "smbclient")
source=("https://github.com/eduardok/libsmbclient-php/archive/${pkgver}.tar.gz")
sha256sums=('9200f6799451d2388e92739fb47c377494b24f20369c4e0be47c505536b6bd3f')

build() {
  cd "libsmbclient-php-${pkgver}"

  phpize${_phpversion}
  ./configure --prefix=/usr
  make
}

package() {
  backup=("etc/php${_phpversion}/conf.d/${_extname}.ini")
  cd "libsmbclient-php-${pkgver}"
  make INSTALL_ROOT="${pkgdir}" install
  echo ";extension=${_extname}.so" > "${_extname}.ini"
  install -D -m644 "${_extname}.ini" "${pkgdir}/etc/php${_phpversion}/conf.d/${_extname}.ini"
}
