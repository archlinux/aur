# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MICSQTL
_pkgver=1.2.2
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
md5sums=('5b939b836d4f9d8558944ce8e6152709')
b2sums=('305aa1eb61988ca53bed71c022bfe3288149f1f7bca062c98d1657e2ed2b3c1ca30a6c575c5fe0bf1e4ba4359826e44178408f556af5897c66d15f71158d9510')

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
