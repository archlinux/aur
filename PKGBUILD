# Maintainer: Stunts <f.pinamartins@gmail.com>
# Contributor: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=vcftools
pkgver=0.1.12b
pkgrel=1
pkgdesc="Easily accessible methods for working with complex genetic variation data in the form of VCF files."
arch=('x86_64')
url="http://vcftools.sourceforge.net/"
license=('GPL3')
depends=('perl' 'zlib')
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}_${pkgver}.tar.gz)
md5sums=('662758d1139c138cf5a0239ed99f12c2')

build() {
  cd "${srcdir}/${pkgname}_${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}_${pkgver}"

  PREFIX="${pkgdir}/usr" make install
  rmdir "${pkgdir}/usr/bin/man1"

  install -D -m755 cpp/vcftools "${pkgdir}/usr/bin/vcftools"
  install -D -m644 cpp/vcftools.1 "${pkgdir}/usr/share/man/man1/vcftools.1"
}
