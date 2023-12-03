# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=phenomis
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Postprocessing and univariate analysis of omics data"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
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
md5sums=('6fc3be4aed9fead1f2038fb3d2837854'
         '599cf91b33571e942d3ba5f9623b8011')
sha256sums=('2f002955d854868a2fd87bcea8902662a4f7089f07d83b490403d00034e1d9fd'
            '0451b634c56ded90b29cd5e40295bcf24bd5224f5ffd7c5f1458535eb90ba85f')

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

  install -Dm644 "$_pkgname-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
