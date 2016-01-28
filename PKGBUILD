# Maintainer: Grey Christoforo <grey at christoforo dot net>

pkgname=rsem
_pkgname=RSEM
pkgver=1.2.26
pkgrel=1
pkgdesc="accurate quantification of gene and isoform expression from RNA-Seq data"
arch=('i686' 'x86_64')
url="http://deweylab.biostat.wisc.edu/rsem/"
install=${pkgname}.install
license=GNU
depends=('perl' 'r')
optdepends=('bowtie2')
source=(https://github.com/bli25wisc/${_pkgname}/archive/v${pkgver}.tar.gz)
md5sums=('228e64cc0f1d1ff4c006e0b64d98cb0f')

build() {
   cd "${srcdir}/${_pkgname}-${pkgver}"
   make
}

package() {
   cd "${srcdir}/${_pkgname}-${pkgver}"
   mkdir -p "${pkgdir}/usr/bin/${pkgname}"
   mv `find . -maxdepth 1 -type f -perm -u+x` "${pkgdir}/usr/bin/${pkgname}/."
   mv WHAT_IS_NEW "${pkgdir}/usr/bin/${pkgname}/."

   mkdir -p "$pkgdir/etc/profile.d"
   echo "export PATH=/usr/bin/${pkgname}:"'$PATH' > "$pkgdir/etc/profile.d/${pkgname}.sh"
}

# vim:set ts=2 sw=2 et:
