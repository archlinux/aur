# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=mastR
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Markers Automated Screening Tool in R"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-annotationdbi
  r-biobase
  r-dplyr
  r-edger
  r-ggplot2
  r-ggpubr
  r-gseabase
  r-limma
  r-msigdb
  r-org.hs.eg.db
  r-patchwork
  r-seuratobject
  r-singlecellexperiment
  r-summarizedexperiment
  r-tidyr
)
checkdepends=(
  r-clusterprofiler
  r-complexheatmap
  r-depmap
  r-rvest
  r-singscore
  r-testthat
  r-upsetr
)
optdepends=(
  r-biocmanager
  r-biocstyle
  r-clusterprofiler
  r-complexheatmap
  r-depmap
  r-enrichplot
  r-ggrepel
  r-ggvenn
  r-glimma
  r-gridextra
  r-jsonlite
  r-knitr
  r-rmarkdown
  r-robustrankaggreg
  r-rvest
  r-scuttle
  r-singscore
  r-splatter
  r-testthat
  r-upsetr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('51a36987fdbde78768b99cdcc8ec6c12')
b2sums=('a47adca4ed222ddbc9fe9d3c309deecf1f104b7e6891bcd0c5c035e16bfe427324bc1f06b5dffa2bc2792adcc21d0e6f210da1f67761f2f8c98b06532568ea52')

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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
