# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>

_pkgname=uploadprogress
pkgname=php-${_pkgname}
pkgver=1.0.3.1
pkgrel=1
pkgdesc="An extension to track progress of a file upload"
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/uploadprogress"
license=('PHP')
depends=('php')
makedepends=('autoconf')
source=("${_pkgname}-${pkgver}"::"git+https://git.php.net/repository/pecl/php/uploadprogress.git")
sha512sums=('SKIP')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  phpize
  ./configure
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make INSTALL_ROOT=${pkgdir} install
  echo "extension=${_pkgname}.so" > "${_pkgname}.ini"
  install -D -m644 "${_pkgname}.ini" "${pkgdir}/etc/php/conf.d/${_pkgname}.ini"
}
