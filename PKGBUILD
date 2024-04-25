# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ccImpute
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=4
pkgdesc="an accurate and scalable consensus clustering based approach to impute dropout events in the single-cell RNA-seq data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
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
b2sums=('94189e8ec6ed3d28471f931469047b2d16b5108088b487c8ca7711cace976900e69238d5e759e0ef030e3fd9c09dcdfccca5109e0887f0971655d43c9c958b27')

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
