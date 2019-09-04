# Maintainer: Boris Momčilović <boris.momcilovic@gmail.com>
pkgname=php-pecl-gender
pkgver=1.1.0
pkgrel=1
pkgdesc="Gender PHP extension is a port of the gender.c program originally written by Joerg Michael. The main purpose is to find out the gender of firstnames. The name dictionary contains >40000 firstnames from 54 countries."
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/gender"
license=('BSD')
makedepends=('autoconf')
source=(http://pecl.php.net/get/gender-${pkgver}.tgz)
sha256sums=('12be9b7ac54bee8d99e0f705bc3ae743af3ee4cfaddb1fc56432024424672d4f')

build() {
  cd ${srcdir}/gender-${pkgver}
  phpize
  ./configure
  make
}

package() {
  cd ${srcdir}/gender-${pkgver}
  make INSTALL_ROOT=${pkgdir} install
  install -d ${pkgdir}/etc/php/conf.d
  echo ";extension=gender.so" > ${pkgdir}/etc/php/conf.d/gender.ini
}
