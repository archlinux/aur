# Maintainer: Leonardo Santana Vieira <leosanvieira at gmail dot com>
# Contributors: Peter Hoeg

_pkgname=pecl-database-mysql
pkgname=${_pkgname}-git
pkgver=17.230a828
pkgrel=1
pkgdesc="PECL MySQL - support mysql_* functions on PHP7"
arch=("i686" "x86_64")
url="https://pecl.php.net/package/mysql"
license=("PHP")
depends=("php")
install=${pkgname}.install
source=("git+https://github.com/php/pecl-database-mysql.git")
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_pkgname}
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${srcdir}/${_pkgname}
  phpize
  ./configure
  make
}

package() {
  cd ${srcdir}/${_pkgname}
  install -Dm755 modules/mysql.so ${pkgdir}/usr/lib/php/modules/mysql.so
}
