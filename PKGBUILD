# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SOMNiBUS
_pkgver=1.16.0
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
md5sums=('b2319cd864a842ba11007d3364243fc9')
b2sums=('cb8084a59206f845658816114b0b2efad72221222944b5ef56dcb213c992498dd695ca19beeb04b07be69c5868399fbcfa5c2f35c097157a436d6125369eaeed')

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
