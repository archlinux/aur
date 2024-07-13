# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=phenomis
_pkgver=1.6.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Postprocessing and univariate analysis of omics data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('CECILL-2.0')
depends=(
  r-biobase
  r-biodb
  r-biodbchebi
  r-data.table
  r-futile.logger
  r-ggplot2
  r-ggrepel
  r-htmlwidgets
  r-igraph
  r-limma
  r-multiassayexperiment
  r-multidataset
  r-plotly
  r-pmcmrplus
  r-ranger
  r-rcolorbrewer
  r-ropls
  r-summarizedexperiment
  r-tibble
  r-tidyr
  r-venndiagram
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-biosigner
  r-cll
  r-knitr
  r-omicade4
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "$_pkgname-LICENSE::http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt")
md5sums=('a7d69a32a7bc9aa484fba3a2139c6c8e'
         '599cf91b33571e942d3ba5f9623b8011')
b2sums=('e5fad70d7edd2216aa21322e2c18b74b2c3058f08b9428a07d27d7e5f1686fe44b303465d8e2fe96f3998c53679b68516d52e2deecf22d7e991bf728e6b67c81'
        'ff97dacc39b8597e670dbaf5bc0f0e4db73eada273708433fc227fa72c054a30a67dbc7b2416089d68f09ab65da721e5b30711022c41047d9cf706731d568038')

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

  install -Dm644 "$_pkgname-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
