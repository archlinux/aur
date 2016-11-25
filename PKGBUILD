# Maintainer: Grey Christoforo <grey at christoforo dot net>

pkgname=rsem
_pkgname=${pkgname^^}
pkgver=1.3.0
pkgrel=1
pkgdesc="accurate quantification of gene and isoform expression from RNA-Seq data"
arch=('i686' 'x86_64')
url="http://deweylab.biostat.wisc.edu/rsem/"
install=${pkgname}.install
license=('GNU GPLv3')
depends=('perl' 'r')
optdepends=('bowtie2')
source=(https://github.com/deweylab/${_pkgname}/archive/v${pkgver}.tar.gz)
md5sums=('9728161625d339d022130e2428604bf5')

build() {
   cd "${srcdir}/${_pkgname}-${pkgver}"
   make
}

package() {
   mkdir -p "${pkgdir}/opt/${pkgname}"

   cd "${srcdir}/${_pkgname}-${pkgver}"
   make install prefix="${pkgdir}/opt/${pkgname}"
   #mv "${srcdir}/${_pkgname}-${pkgver}" "${pkgdir}/opt/${pkgname}"

   mkdir -p "$pkgdir/etc/profile.d"
   echo "export PATH=/opt/${pkgname}/bin:"'$PATH' > "$pkgdir/etc/profile.d/${pkgname}.sh"
}

# vim:set ts=2 sw=2 et:
