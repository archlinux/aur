# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=biomvRCNS
_pkgver=1.44.0
pkgname=r-${_pkgname,,}
pkgver=1.44.0
pkgrel=1
pkgdesc='Copy Number study and Segmentation for multivariate biological data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-genomicranges
  r-gviz
  r-iranges
  r-mvtnorm
)
optdepends=(
  r-cluster
  r-dynamictreecut
  r-genomicfeatures
  r-parallel
  r-rsamtools
  r-txdb.hsapiens.ucsc.hg19.knowngene
)
makedepends=(git)
source=("git+https://git.bioconductor.org/packages/${_pkgname}")
sha256sums=('SKIP')

prepare(){
  cd $srcdir/${_pkgname}/src
  # For R 4.3.0+
  # see https://github.com/wch/r-source/blob/trunk/src/include/R_ext/Constants.h#L46
  sed -i 's|DOUBLE_X|DBL_|g' biomvRCNS.c
  cd $srcdir
  tar -czf $_pkgname-$_pkgver.tar.gz ${_pkgname}
}

build() {
  R CMD INSTALL ${_pkgname}-${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
