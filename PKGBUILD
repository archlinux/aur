# Maintainer: Adrian Sausenthaler <aur@sausenthaler.de>

pkgname=php-mcrypt
pkgver=8.0.0
pkgrel=1
mcrypt_plugin_ver=1.0.4
pkgdesc="mcrypt module for extra/php package (>=8.0.0, <=8.1.0)"
arch=('i686' 'x86_64')
url="https://pecl.php.net/package/mcrypt"
license=('PHP')
depends=('php' 'libmcrypt')
makedepends=('autoconf' 're2c')
source=(http://pecl.php.net/get/mcrypt-${mcrypt_plugin_ver}.tgz)
install=mcrypt.install
md5sums=('7097fac371820ff130c90330b556f1bf')

build() {
  cd ${srcdir}/mcrypt-${mcrypt_plugin_ver}
  phpize
  ./configure
  make
}

package() {
  cd ${srcdir}/mcrypt-${mcrypt_plugin_ver}
  make INSTALL_ROOT=${pkgdir} install
  install -d ${pkgdir}/etc/php/conf.d
  echo "extension=mcrypt.so" > ${pkgdir}/etc/php/conf.d/mcrypt.ini
}
