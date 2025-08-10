# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Aurelien Foret <orelien@chez.com>

pkgname=setserial
pkgver=2.17
pkgrel=6
pkgdesc="Allows to change various attributes of a serial device"
arch=('x86_64' 'i686')
url="http://setserial.sourceforge.net/"
license=('GPL')
depends=('glibc')
source=("http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        'setserial.patch'
        'setserial2.patch')
md5sums=('c4867d72c41564318e0107745eb7a0f2'
         '99919d3be7c1550721494070a7ace66a'
         '5aa15f7d3c80676dfebcac057ddd7a71')

prepare(){
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  aclocal
  autoconf

  patch -Np1 -i "${srcdir}/setserial.patch"
  patch -Np1 -i "${srcdir}/setserial2.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr \
              --mandir=/usr/share/man
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  install -d ${pkgdir}/usr/{bin,share/man/man8}
  make DESTDIR="${pkgdir}" install
}
