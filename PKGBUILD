# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=mastR
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Markers Automated Screening Tool in R"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(MIT)
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
md5sums=('be4cab3fb29097cb5dd34ee7ba1ce228')
sha256sums=('737aa6ecdc654d033c058c0c963ad640748fece20ba6ffe1afc53cb31b9e4b8f')

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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
