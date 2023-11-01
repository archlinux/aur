# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ANCOMBC
_pkgver=2.4.0
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
md5sums=('42059f62faa03e818d0cd15b7bcf0094')
sha256sums=('874699e6662d2624d174fe877e0e81024ecc5aa636d5b23ed9b5c09e5698c3d4')

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
