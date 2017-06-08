# Maintainer: Leonardo Santana Vieira <leosanvieira at gmail dot com>
# Contributor: Peter Hoeg

_pkgname=pecl-database-mysql
pkgname=${_pkgname}-git
pkgver=17.230a828
pkgrel=3
pkgdesc="PECL MySQL - support mysql_* functions on PHP7"
arch=("i686" "x86_64")
url="https://pecl.php.net/package/mysql"
license=("PHP")
depends=("php")
source=("git+https://github.com/php/pecl-database-mysql.git"
        "pecl-database-mysql-git.ini")
md5sums=('SKIP'
         'e65a4b06b876b035e306c2744f7b8fd2')

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
  cd ${srcdir}
  install -Dm644 ${pkgname}.ini ${pkgdir}/etc/php/conf.d/${pkgname}.ini
  install -Dm755 ${_pkgname}/modules/mysql.so ${pkgdir}/usr/lib/php/modules/mysql.so
}
