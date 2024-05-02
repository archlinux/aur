# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=IsoBayes
_pkgver=1.2.0
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
md5sums=('ec1e8cf8cdbc12a707fd99e18ec511b9')
b2sums=('7903239768e707e12429d2c8e9d7db7ddb7deef7e90b3d208d977054e5710035bda7e9aa7cd0914f705244c5f6f148bee7eeb50aeb8e886a51af6c97573f24c6')

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
