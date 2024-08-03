# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=IsoBayes
_pkgver=1.2.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('03ec20adfb1df43f7b938ad412bb9ef9')
b2sums=('56c3477c9f3698e534ee1050e578e4e391cf0d673f086bed509d29fa83339a74570ba62e04a4d246c10013f3a625b9683f4de255aeb478284a2cccf15b8ae17d')

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
