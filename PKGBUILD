# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=IsoBayes
_pkgver=1.0.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=4
pkgdesc="Single Isoform protein inference Method via Bayesian Analyses"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-data.table
  r-doparallel
  r-dorng
  r-foreach
  r-ggplot2
  r-glue
  r-hdinterval
  r-iterators
  r-rcpp
  r-s4vectors
  r-summarizedexperiment
)
makedepends=(
  r-rcpparmadillo
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d9e1de9f5a1f8279117fde4cc997725d')
b2sums=('3e4fe0d17b24c74709e2d86a9c0559e521d3a78a178e5f21348f1bb918addb5743c0601f5723b677b924f70d3751d2bad4ed096a79bc2514bb6a8d9ae67e24cb')

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
