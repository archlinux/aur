# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=OUTRIDER
_pkgver=1.24.0
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
md5sums=('ecb42761f893c9a73a6a0195fa4ff84f')
b2sums=('06e3e86b5a0d70372f61f033e4075844ec3c038358c28b34f7799b09fe1f48e05743b0f86b4561eb0e79a139830d2c2f0c1f1e748a7cf1ecd3e7a790f8877a36')

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
