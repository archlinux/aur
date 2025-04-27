# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=comapr
_pkgver=1.12.0
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
md5sums=('027e81fa1d8b4782270312c39c3b64c6')
b2sums=('5ccc6930ef10ac5ae379abfb8f91397e65e83ad7a7f5c9edd9d353bd3d4f28db60d1698a3a170712d6bf8a26f4cfa9e91ee140f5ef7410144da76e4f44ff9f1a')

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
