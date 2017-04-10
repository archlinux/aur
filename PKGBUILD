# Contributor: Matteo Mattei <info@matteomattei.com>

pkgname=php-pam
_extname=pam
pkgver=1.0.3
pkgrel=4
pkgdesc="This extension provides PAM (Pluggable Authentication Modules) integration in PHP."
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/PAM"
license=('PHP')
depends=('php' 'pam' 'php-pear')
makedepends=('autoconf')
#install=php-pam.install
source=(http://pecl.php.net/get/pam-${pkgver}.tgz pam.ini php zend.patch)
md5sums=('2dfd378a76021245050333cd4d49ed96' '9582d5f0476e486f2c3084940f1abd86' '5fb207f61ff94b0cc7a2dcc1e3c1c388'
'806c2d6052159dd58e392dbe91711d05')

build() {
  patch -p0 < ../zend.patch
  cd "${_extname}-${pkgver}"
  phpize
  ./configure --prefix=/usr
  make
}

package() {
  cd "${_extname}-${pkgver}"
  make INSTALL_ROOT="${pkgdir}" install
  install -D -m644 "${srcdir}/${_extname}.ini" "${pkgdir}/etc/php/conf.d/${_extname}.ini"
  install -D -m644 "${srcdir}/php" ${pkgdir}/etc/pam.d/php
}
