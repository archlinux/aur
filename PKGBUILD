# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=signifinder
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Implementations of transcriptional cancer signatures"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(AGPL3)
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
sha256sums=('330b2ae04fd1b4d02053dfecc4698efe3543c7ea42e430e0df2598915c2464fa')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
