# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=mastR
_pkgver=1.6.0
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
  r-bisquerna
  r-clusterprofiler
  r-complexheatmap
  r-depmap
  r-enrichplot
  r-ggrepel
  r-ggvenn
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
md5sums=('ef996ab3532927e3c4f825aac2d741e1')
b2sums=('44e44d1749440210f3cdf09a691347f5b7b1a2ef6e82213f0c373594e402ae04395e3a55fffc2a03df9a70a83a405ce31a15ece0e86c07f809441ffb3b736a0d')

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
