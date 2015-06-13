# Maintainer: Maurizio Porrato <maurizio.porrato@gmail.com>

pkgname=ilbc
pkgver=rfc3951
pkgrel=6
arch=(i686 x86_64)
pkgdesc="A free speech codec suitable for robust VoIP"
url="http://www.ilbcfreeware.org/"
license=('custom')
depends=('glibc')
makedepends=('awk')
options=(strip)
source=(http://www.ietf.org/rfc/rfc3951.txt
  http://www.ilbcfreeware.org/documentation/extract-cfile.txt
  Makefile
  gips_iLBClicense.txt)
md5sums=('984affd9bf2053064d744a2ccec82289'
         '25f44e2e725ed2a7504238aaeb4a89e7'
         '833675ff45c04be62bc9d6b2fb6fa508'
         'b738390e4108560b8b593454607ddc2b')

prepare() {
  rm -rf ${srcdir}/${pkgname}-${pkgver}
  mkdir ${srcdir}/${pkgname}-${pkgver}
  cp ${srcdir}/Makefile ${srcdir}/${pkgname}-${pkgver}
  cd ${srcdir}/${pkgname}-${pkgver}
  awk -f ${srcdir}/extract-cfile.txt ${srcdir}/rfc3951.txt  
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
  install -d ${pkgdir}/usr/share/licenses/ilbc
  install -D ${srcdir}/gips_iLBClicense.txt ${pkgdir}/usr/share/licenses/ilbc
}

# vim:set ts=2 sw=2 et:
