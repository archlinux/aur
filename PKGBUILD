# Maintainer: Grey Christoforo <grey at christoforo dot net>

pkgname=rsem
_pkgname=RSEM
pkgver=1.2.31
pkgrel=1
pkgdesc="accurate quantification of gene and isoform expression from RNA-Seq data"
arch=('i686' 'x86_64')
url="http://deweylab.biostat.wisc.edu/rsem/"
install=${pkgname}.install
license=('GNU GPLv3')
depends=('perl' 'r')
optdepends=('bowtie2')
source=(https://github.com/bli25wisc/${_pkgname}/archive/v${pkgver}.tar.gz)
md5sums=('00ce62a24eebef7d0b7d4f866eee0fc7')

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
