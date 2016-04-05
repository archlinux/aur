# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Please report issues at https://github.com/sanduhrs/arch-aur-php-uploadprogress-git

_pkgname=uploadprogress
pkgname=php-${_pkgname}-git
pkgver=r57.95d8a0f
pkgrel=1
pkgdesc="An extension to track progress of a file upload"
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/uploadprogress"
license=('PHP')
depends=('php')
makedepends=('php' 'git' 'autoconf')
provides=("php-${_pkgname}")
conflicts=("php-${_pkgname}")
install=${_pkgname}.install
source=("${_pkgname}"::"git+https://git.php.net/repository/pecl/php/uploadprogress.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

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
