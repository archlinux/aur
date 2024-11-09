# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=TREG
_pkgver=1.10.0
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
md5sums=('871bb50be403533bc358bbf9c96e0df4')
b2sums=('ca54c0e73cab82090616c214a3260634fe8dae79b0ce7b14c9f367a6e0e70fd8aad036a0c188cab73ef67efcb63d1f7ac351378dae07be3e4f51044813886379')

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
