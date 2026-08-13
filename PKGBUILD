# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MICSQTL
_pkgver=1.10.0
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
md5sums=('f8f414de62cb99cdf470414a3a45c8ae')
b2sums=('d830fabc56bb9d9c4f54ff618dbb30d61656d02392a350a14a06dc5966c3187d35a666ea7fc8f0748bc40fe83f8fa5e5f790f34777cf0de43c9c66314eb994cf')

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
