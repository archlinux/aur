# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MICSQTL
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=4
pkgdesc="Multi-omic deconvolution, Integration and Cell-type-specific Quantitative Trait Loci"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biocparallel
  r-dirmult
  r-ggplot2
  r-ggpubr
  r-ggridges
  r-glue
  r-magrittr
  r-nnls
  r-purrr
  r-s4vectors
  r-summarizedexperiment
  r-tca
  r-toast
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
md5sums=('ec49e08df014da6955d2b6ab7dc77d3b')
b2sums=('7d7d888e1233711591ce8f57c8f230539b3542a7de78330f0e669f8ffb923f10a264c649fca1e77b9017d4f3f1927d684db4c67a19189a6b2bed64656d56bb44')

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
