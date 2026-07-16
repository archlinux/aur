# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ccImpute
_pkgver=1.14.0
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
md5sums=('f88ac67b403661032fc9659f5063a315')
b2sums=('913f59579b6e3b6cf210eb39249fd3459f132e85b2424a34056217f66464d57589af4d5559c339db304eb11c134979e97d73316e7e32770518943be6357a021d')

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
