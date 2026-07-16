# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=comapr
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Crossover analysis and genetic map construction"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-biocparallel
  r-circlize
  r-dplyr
  r-foreach
  r-genomeinfodb
  r-genomicranges
  r-ggplot2
  r-gridextra
  r-gviz
  r-iranges
  r-plotly
  r-plyr
  r-rcolorbrewer
  r-reshape2
  r-rlang
  r-s4vectors
  r-scales
  r-summarizedexperiment
  r-tidyr
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-statmod
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b0e0d8b751b205d74cdb60d4ff9104f5')
b2sums=('796a734a38ae5f8b178057325f346edc1c66500a44cbf1b70cedde6dbc7b84f73ef62544ae4df29d9b52648b438ba925140e215d76c0137c54229566724c0e7d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

#check() {
#  cd "$_pkgname/tests"
#  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
#}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
