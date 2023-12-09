# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=DifferentialRegulation
_pkgver=2.0.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Differentially regulated genes from scRNA-seq data"
arch=(x86_64)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
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
md5sums=('875793d502c3e521b4faa3eba0d1c2e7')
sha256sums=('087b222c3418d45082991a93f3fe3ec2f0794de2d79376f923b6864dd531c849')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testhat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
