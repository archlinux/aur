# Maintainer: Adrian Sausenthaler <aur@sausenthaler.de>

pkgname=php74-mcrypt
pkgver=1.0.7
pkgrel=2
pkgdesc="mcrypt module for AUR/php74 package (>=7.2.0, <=8.4.0)"
arch=('i686' 'x86_64')
url="https://pecl.php.net/package/mcrypt"
license=('PHP')
depends=('php74' 'libmcrypt')
optdepends=('php74-cli: The php(74) command line interpreter (for tests)')
makedepends=('autoconf' 're2c')
source=(http://pecl.php.net/get/mcrypt-${pkgver}.tgz)
install=mcrypt.install
sha256sums=('12ea2fbbf2e2efbe790a12121f77bf096c8b84cef81d0216bec00d56e5badef4')

build() {
  cd ${srcdir}/mcrypt-${pkgver}
  phpize74
  ./configure
  make
}

package() {
  cd ${srcdir}/mcrypt-${pkgver}
  make INSTALL_ROOT=${pkgdir} install
  install -d ${pkgdir}/etc/php74/conf.d
  echo "extension=mcrypt.so" > ${pkgdir}/etc/php74/conf.d/mcrypt.ini
}

# Testing:
# php74 -v
# php74 -i | grep mcrypt
