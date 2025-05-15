# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=OUTRIDER
_pkgver=1.26.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="OUTlier in RNA-Seq fInDER"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  blas
  r-bbmisc
  r-biocgenerics
  r-biocparallel
  r-data.table
  r-deseq2
  r-generics
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-ggrepel
  r-heatmaply
  r-iranges
  r-matrixstats
  r-pcamethods
  r-pheatmap
  r-plotly
  r-plyr
  r-prroc
  r-rcolorbrewer
  r-reshape2
  r-s4vectors
  r-scales
  r-summarizedexperiment
  r-txdbmaker
)
makedepends=(
  r-rcpp
  r-rcpparmadillo
)
optdepends=(
  r-annotationdbi
  r-beeswarm
  r-biocstyle
  r-biovizbase
  r-covr
  r-genomeinfodb
  r-ggbio
  r-knitr
  r-org.hs.eg.db
  r-rmariadb
  r-rmarkdown
  r-testthat
  r-txdb.hsapiens.ucsc.hg19.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b0a19b7ea0f462de9a2e5bf0102b02fd')
b2sums=('21861e2044fa3e56cfdb663862d45da76be30f1f08e191e5d11d17aaf3b201df702a0322ed0020b1c1294bdb1c3e60037f71bb3da2cd6fd460c93349564b3aac')

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
