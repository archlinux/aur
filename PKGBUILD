# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=TREG
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Tools for finding Total RNA Expression Genes in single nucleus RNA-seq data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-purrr
  r-rafalib
  r-summarizedexperiment
)
checkdepends=(
  r-dplyr
  r-testthat
)
optdepends=(
  r-biocfilecache
  r-biocstyle
  r-dplyr
  r-ggplot2
  r-knitr
  r-pheatmap
  r-refmanager
  r-rmarkdown
  r-sessioninfo
  r-singlecellexperiment
  r-testthat
  r-tibble
  r-tidyr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6ab2e5ab222d993ba7425f008a1e7bf2')
b2sums=('780eb8da9c7eb38d3ca2f2e243e4cebe81b8a6dd1d7f6a31e19388438296fc1849373f68eeb3e9418159720959fd202ea02b12ccb494ca29a03fa98dac77fa82')

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
}
