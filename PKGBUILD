# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SOMNiBUS
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Smooth modeling of bisulfite sequencing"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-annotatr
  r-biocmanager
  r-bsseq
  r-data.table
  r-genomeinfodb
  r-genomicranges
  r-ggplot2
  r-iranges
  r-reshape2
  r-rtracklayer
  r-s4vectors
  r-tidyr
  r-vgam
  r-yaml
)
optdepends=(
  r-biocstyle
  r-covr
  r-devtools
  r-dplyr
  r-knitr
  r-magick
  r-org.hs.eg.db
  r-rmarkdown
  r-testthat
  r-txdb.hsapiens.ucsc.hg19.knowngene
  r-txdb.hsapiens.ucsc.hg38.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2a3d47efb84e87d5b15d3c281fadb420')
b2sums=('1d00188aa88a77563b87c5a4f825ff77bbf9987703ddcceb984ced930a99037a74b74ac9f4cfba685441053552e2cb717e8c8881cf8d8f9d86acef59a0ac784a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
