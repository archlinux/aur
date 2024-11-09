# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=VDJdive
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Analysis Tools for 10X V(D)J Data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biocparallel
  r-cowplot
  r-ggplot2
  r-gridextra
  r-iranges
  r-rcolorbrewer
  r-rcpp
  r-s4vectors
  r-singlecellexperiment
  r-summarizedexperiment
)
checkdepends=(
  r-breakaway
  r-testthat
)
optdepends=(
  r-biocstyle
  r-breakaway
  r-covr
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e36bca9c91ac3f6a9499e622ee72c775')
b2sums=('afd3ae083615ebd33fd85a97de7a1380c965d3bb402abf1905f161cfa009e53017670834a2fabb58405b1467328d07185ccfd4a58676b216b6974c3b51a7815c')

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
