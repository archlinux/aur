# Maintainer: Matteo Mattei <info@matteomattei.com>
# Maintainer: Amish <contact at via dot aur>

pkgname=php-pam
pkgver=2.1.0
pkgrel=1
pkgdesc="This extension provides PAM (Pluggable Authentication Modules) integration in PHP."
arch=('i686' 'x86_64')
url="https://github.com/amishmm/php-pam"
license=('PHP')
depends=('php>=7.2.0' 'pam' 'php-pear')
makedepends=('autoconf')
#install=php-pam.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/amishmm/${pkgname}/archive/v${pkgver}.tar.gz" pam.ini php)
md5sums=('0182234a17611e79f537c0b16927fe8e'
         '9582d5f0476e486f2c3084940f1abd86'
         '5fb207f61ff94b0cc7a2dcc1e3c1c388')

build() {
  cd "${pkgname}-${pkgver}"
  phpize
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make INSTALL_ROOT="${pkgdir}" install
  install -D -m644 "${srcdir}/pam.ini" "${pkgdir}/etc/php/conf.d/pam.ini"
  install -D -m644 "${srcdir}/php" ${pkgdir}/etc/pam.d/php
}
