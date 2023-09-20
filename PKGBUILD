# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ANCOMBC
_pkgver=2.2.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Microbiome differential abudance and correlation analyses with bias correction"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Artistic2.0)
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
  r-mia
  r-multcomp
  r-nloptr
  r-rdpack
  r-s4vectors
  r-singlecellexperiment
  r-summarizedexperiment
  r-treesummarizedexperiment
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
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8c9c1dbb6aa5437dafe5214e5757935f')
sha256sums=('a318c4d2bdfc358b54fafbd06bc68c6cc9c41dd614b0aacfb50f30fe301f9a4b')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
