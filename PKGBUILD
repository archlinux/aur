_phpbase=81
pkgname=php${_phpbase}-mcrypt
pkgver=1.0.4
pkgrel=1
pkgdesc="php${_phpbase} bindings for the unmaintained libmcrypt. For compat purposes"
arch=('i686' 'x86_64')
url="https://pecl.php.net/package/mcrypt"
license=('PHP')
depends=('php81' 'libmcrypt')
makedepends=('autoconf' 're2c')
source=(http://pecl.php.net/get/mcrypt-${pkgver}.tgz)
install=mcrypt.install

build() {
  cd ${srcdir}/mcrypt-${pkgver}
  phpize${_phpbase}
  ./configure --with-php-config=php-config${_phpbase}
  make
}

package() {
  cd ${srcdir}/mcrypt-${pkgver}
  make INSTALL_ROOT=${pkgdir} install
  install -d ${pkgdir}/etc/php${_phpbase}/conf.d
  echo "extension=mcrypt.so" > ${pkgdir}/etc/php${_phpbase}/conf.d/mcrypt.ini
}

md5sums=('7097fac371820ff130c90330b556f1bf')
