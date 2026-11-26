# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=TREG
_pkgver=1.18.0
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
md5sums=('fa4bd47d266fe47687e830c6c13a586f')
b2sums=('f170126e99d6b2efb2cd6b5ed2d3d332ae5ce7c545dae941119e0cf779a8d40ac8c6c3d1bd6271f2901438ea35482932a85c7036015339787fcdcf02f4094e92')

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
