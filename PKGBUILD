# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ccImpute
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="ccImpute: an accurate and scalable consensus clustering based approach to impute dropout events in the single-cell RNA-seq data (https://doi.org/10.1186/s12859-022-04814-8)"
arch=(x86_64)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
depends=(
  r-biocparallel
  r-matrixstats
  r-rcpp
  r-simlr
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
  r-singlecellexperiment
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f402177e3fc7bbbcac504c956889dfa9')
sha256sums=('12728b12c2f470112c7a3108a6f999d798d67e07f892c75f08571c6462f2476c')

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
