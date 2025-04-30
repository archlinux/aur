# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ANCOMBC
_pkgver=2.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Microbiome differential abudance and correlation analyses with bias correction"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-cvxr
  r-desctools
  r-doparallel
  r-dorng
  r-energy
  r-foreach
  r-gtools
  r-hmisc
  r-lme4
  r-lmertest
  r-multcomp
  r-nloptr
  r-rdpack
)
checkdepends=(
  r-microbiome
  r-testthat
)
optdepends=(
  r-dplyr
  r-dt
  r-knitr
  r-magrittr
  r-microbiome
  r-rmarkdown
  r-testthat
  r-tidyr
  r-tidyverse
  r-phyloseq
  r-mia
  r-s4vectors
  r-singlecellexperiment
  r-summarizedexperiment
  r-treesummarizedexperiment
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('23016cc495f712da8fbeb6c9da6f3ccf')
b2sums=('0e66331e1c9ea0f786385428f5075f217ea38a4e3f0ef51f6ce951af428dd36fe92fc5b672b1bae7b43bbefb4c4fbccffb45111d1bd3a439079c4f9cb72f01ce')

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
