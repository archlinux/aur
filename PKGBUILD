# Maintainer: James An <james@jamesan.ca>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=php-suhosin7-git
_pkgname=${pkgname%-git}
__pkgname=${_pkgname#php-}
pkgver=0.10.0dev.r58.ge55e273
pkgrel=1
pkgdesc='An advanced protection system for PHP installations'
arch=('i686' 'x86_64')
url='http://suhosin.org/'
license=('PHP')
depends=('php')
checkdepends=('php-cgi')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
backup=('etc/php/conf.d/$__pkgname.ini')
source=("$_pkgname"::"git+https://github.com/sektioneins/$__pkgname.git")
md5sums=('SKIP')

build() {
  cd $_pkgname

  phpize
  ./configure --prefix=/usr --enable-$__pkgname
  make
}

check() {
  cd $_pkgname

  NO_INTERACTION=1 REPORT_EXIT_STATUS=1 make -k test
}

package() {
  cd $_pkgname

  make INSTALL_ROOT=$pkgdir install
  install -D -m644 $__pkgname.ini $pkgdir/etc/php/conf.d/$__pkgname.ini
}
