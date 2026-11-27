# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=isomiRs
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Analyze isomiRs and miRNAs from small RNA-seq"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-annotationdbi
  r-biobase
  r-biocgenerics
  r-broom
  r-cowplot
  r-degreport
  r-deseq2
  r-dplyr
  r-genomicranges
  r-ggally
  r-ggplot2
  r-gplots
  r-gridextra
  r-gtools
  r-iranges
  r-limma
  r-rcolorbrewer
  r-readr
  r-reshape
  r-rlang
  r-s4vectors
  r-stringr
  r-summarizedexperiment
  r-tibble
  r-tidyr
)
optdepends=(
  r-biocstyle
  r-knitr
  r-org.mm.eg.db
  r-pheatmap
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('85684c3426a1728d37fcf4a8793878c1')
b2sums=('58c900471fd56792fbc02f9af6a569c1e5c9baf71d0709be763f086ff8328fabdbc8f25c0760a9897733147274513e8a64e4da3708d5071a812547ef911ac72e')

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
