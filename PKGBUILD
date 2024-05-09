# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=signifinder
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Collection and implementation of public transcriptional cancer signatures"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('AGPL-3.0-only')
depends=(
  r-annotationdbi
  r-biocgenerics
  r-complexheatmap
  r-consensusov
  r-cowplot
  r-dgeobj.utils
  r-dplyr
  r-ensembldb
  r-ggplot2
  r-ggridges
  r-gsva
  r-iranges
  r-magrittr
  r-matrixstats
  r-maxstat
  r-openair
  r-org.hs.eg.db
  r-patchwork
  r-rcolorbrewer
  r-sparrow
  r-spatialexperiment
  r-summarizedexperiment
  r-survminer
  r-txdb.hsapiens.ucsc.hg19.knowngene
  r-txdb.hsapiens.ucsc.hg38.knowngene
  r-viridis
)
checkdepends=(
  r-edger
  r-testthat
)
optdepends=(
  r-biocstyle
  r-edger
  r-kableextra
  r-knitr
  r-limma
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1d53f15acfd9181d1fe5b78e93891373')
b2sums=('b6a7efe722e9929012bc74aef4a7d3f8f0200066aa78ab3e88f25dbe3cc346dd8395091da54e37a13d727b538bb57e1e7ad298a81267b70c0717558e121ddbdd')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
