# Maintainer: Maurizio Porrato <maurizio.porrato@gmail.com>

pkgname=ilbc
pkgver=rfc3951
pkgrel=7
arch=(i686 x86_64)
pkgdesc="A free speech codec suitable for robust VoIP"
url="http://www.ilbcfreeware.org/"
license=('custom')
depends=('glibc')
makedepends=('awk')
options=(strip)
source=(http://www.ietf.org/rfc/rfc3951.txt
  extract-cfile.awk
  Makefile
  gips_iLBClicense.txt)
md5sums=('984affd9bf2053064d744a2ccec82289'
         '24b50efef208a60dd1269b227b939a6a'
         '833675ff45c04be62bc9d6b2fb6fa508'
         'b738390e4108560b8b593454607ddc2b')

prepare() {
  rm -rf ${srcdir}/${pkgname}-${pkgver}
  mkdir ${srcdir}/${pkgname}-${pkgver}
  cp ${srcdir}/Makefile ${srcdir}/${pkgname}-${pkgver}
  cd ${srcdir}/${pkgname}-${pkgver}
  awk -f ${srcdir}/extract-cfile.awk ${srcdir}/rfc3951.txt  
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
