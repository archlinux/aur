# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Please report issues at https://github.com/sanduhrs/arch-aur-php-uploadprogress

_pkgname=uploadprogress
pkgname=php-${_pkgname}
pkgver=1.1.3
pkgrel=1
pkgdesc="An extension to track progress of a file upload"
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/uploadprogress"
license=('PHP')
depends=('php')
makedepends=('php' 'git' 'autoconf')
install=${_pkgname}.install
source=("${_pkgname}"::"git+https://git.php.net/repository/pecl/php/uploadprogress.git#tag=uploadprogress-${pkgver}")
sha512sums=('SKIP')

build() {
  cd "${srcdir}/${_pkgname}"
  phpize
  ./configure
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  echo ";extension=${_pkgname}.so" > ${_pkgname}.ini
  install -Dm644 ${_pkgname}.ini "${pkgdir}/etc/php/conf.d/${_pkgname}.ini"
  make install INSTALL_ROOT="${pkgdir}/"
}
