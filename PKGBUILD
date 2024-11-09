# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ccImpute
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="an accurate and scalable consensus clustering based approach to impute dropout events in the single-cell RNA-seq data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  blas
  r-biocparallel
  r-irlba
  r-rcpp
  r-singlecellexperiment
  r-sparsematrixstats
  r-summarizedexperiment
)
makedepends=(
  r-rcppeigen
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-mclust
  r-rmarkdown
  r-scater
  r-scrnaseq
  r-sessioninfo
  r-splatter
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1f2214b009e55a529068e1618e30b81f')
b2sums=('47cab6238e174fc21c9ed2270cfba9b1c9b4afc3e7f9ceffa64318f7d9aa445906b3e07e04c3680df30f2a51238559935df7042cc60a5dd3a6d42cc116c26da7')

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
