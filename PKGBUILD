# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=IsoBayes
_pkgver=1.6.1
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
md5sums=('7e8aa0ac58782f54a70b56350ba56248')
b2sums=('78993f8e6fe82d66ee85bbd854d04ca7015dada4aceb7ca754baefea220c6034ecff3d8846345a240a80fca4d7b58ce217756e587e9a108a26b35318adf65bec')

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
