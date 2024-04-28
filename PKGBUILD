# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=signifinder
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Implementations of transcriptional cancer signatures"
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
md5sums=('f24a46dbbbc9b688450e9f2a0e2e221e')
b2sums=('fba1b218166a5dcfe58b773bceab2f987eb8db9fd70197767decc5b8120954e1277f5c5aed25b775174cce214cc878d3428fa3b44ae9d6452773690a5c8fd07a')

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
