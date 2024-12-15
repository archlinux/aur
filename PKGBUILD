# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=DifferentialRegulation
_pkgver=2.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Differentially regulated genes from scRNA-seq data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  blas
  lapack
  r-bandits
  r-data.table
  r-doparallel
  r-dorng
  r-foreach
  r-ggplot2
  r-gridextra
  r-rcpp
  r-singlecellexperiment
  r-summarizedexperiment
  r-tximport
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
md5sums=('a246cfd93fb21229ebb7ff130557a983')
b2sums=('74384d3fc19117a436e6f2f353088ad8ea75ed574092cdc122f57abdebfb3610293b0014b79edd78fc31efb9299c915e2cd7dba649bd19e05ca744ed0b9b5ed5')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testhat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
