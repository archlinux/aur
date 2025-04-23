# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MICSQTL
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('c2888546e1f68815cb77ba3a8a2904e2')
b2sums=('aa431919b5a909c87d9744dedea5ac202e1bb3ef9b3a643ca27deb48c2b31fd86b68fb05b9531cc6cb1a9e7fe3d8676698a1ee5a294600ac9ad1ae97533d2972')

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
