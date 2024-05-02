# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MICSQTL
_pkgver=1.2.0
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
md5sums=('346e79cd1e745850fef1533768cbd893')
b2sums=('e5151375fd4633c22bf8a90d0a3dbb713a94e1c2478ef1fb1e0889d5565a0f380df0adff7c4ab7f737ce1e480aa5b4b7e6262dc3ec0d6e1873048b9926616de3')

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
