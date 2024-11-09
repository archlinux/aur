# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=vsclust
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Feature-based variance-sensitive quantitative clustering"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-limma
  r-matrixstats
  r-multiassayexperiment
  r-qvalue
  r-shiny
)
makedepends=(
  r-rcpp
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-clusterprofiler
  r-knitr
  r-rmarkdown
  r-testthat
  r-yaml
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5c1a8e08525ed6e692ef423a14d5e9e9')
b2sums=('3e9e653f98d2ac38f94b62d9d7c93503d689df52ae55b46cecfde6abb6d674a63f39a29c15135f5a11649fb3525e179c0a40421e808ab47b8b2cdc22f5454165')

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
