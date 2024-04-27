# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=mastR
_pkgver=1.2.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
md5sums=('e3c3d512fc0082d6c51dab26088b79f7')
b2sums=('0fa3f41060978d76e5447740f702e5a4d0026c032f12573c261d8d3409b4ef712addaa87987e7185d04b44682d6f7dd3ed44dc7736e808797a79985b3801d22c')

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
