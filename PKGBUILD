# $Id: PKGBUILD 325156 2018-05-30 18:42:15Z jelle $
# Maintainer: dorphell <dorphell@archlinux.org>
# Contributor: Aurelien Foret <orelien@chez.com>

pkgname=speedtouch
pkgver=1.3.1
pkgrel=6
pkgdesc="Driver for the ADSL Speed Touch USB modem"
arch=('x86_64')
url="http://speedtouch.sourceforge.net/"
license=('GPL')
depends=('bash')
source=("http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.bz2" 
	'speedtouch-1.3.1-gcc4.patch')
md5sums=('0848a120ae0eeab6c8ab378e11dc4fa2' 
         '4c82a6b2c3685fc8db5f4ee591ed1277')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  patch -Np1 -i ${srcdir}/speedtouch-1.3.1-gcc4.patch
  ./configure --prefix=/usr \
              --sbindir=/usr/bin \
              --sysconfdir=/etc \
              --mandir=/usr/share/man
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make prefix=${pkgdir}/usr sbindir=${pkgdir}/usr/bin sysconfdir=${pkgdir}/etc mandir=${pkgdir}/usr/share/man install
}
