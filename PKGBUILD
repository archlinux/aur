# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=EDIRquery
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Query the EDIR Database For Specific Gene"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-genomicranges
  r-interactionset
  r-readr
  r-tibble
  r-tictoc
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a134b36fa5d78e96a713e8d7508038a8')
b2sums=('e7c7efa4389431a0a1a17dd7712de4ca344fda7edfb303f971bacc3c8d9047cfcd52a9c3a2d963c8cd67f9c96c4e32f67811f9380669f9bf529de9dcb61be528')

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
