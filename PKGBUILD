# Maintainer: Adrian Sausenthaler <aur@sausenthaler.de>

pkgname=php74-mcrypt
pkgver=1.0.4
pkgrel=1
pkgdesc="mcrypt module for extra/php package (7.2.0-8.1.0)"
arch=('i686' 'x86_64')
url="https://pecl.php.net/package/mcrypt"
license=('PHP')
depends=('php' 'libmcrypt')
makedepends=('autoconf' 're2c')
source=(http://pecl.php.net/get/mcrypt-${pkgver}.tgz)
install=mcrypt.install
md5sums=('7097fac371820ff130c90330b556f1bf')

build() {
  cd ${srcdir}/mcrypt-${pkgver}
  phpize
  ./configure
  make
}

package() {
  cd ${srcdir}/mcrypt-${pkgver}
  make INSTALL_ROOT=${pkgdir} install
  install -d ${pkgdir}/etc/php/conf.d
  echo "extension=mcrypt.so" > ${pkgdir}/etc/php/conf.d/mcrypt.ini
}
