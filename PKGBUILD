# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=phenomis
_pkgver=1.6.4
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
md5sums=('e40b22138ac05862c136ef7c96159dc1'
         '599cf91b33571e942d3ba5f9623b8011')
b2sums=('a90918bcdea9989449b3dd833142a3522faeac9cbc34c864e0ae5b49b665fb8fc97e4544574d1bde4175101a37fe8dee7371d68f2a9cdc94251d4862814862b7'
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
