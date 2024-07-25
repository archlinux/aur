# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ccImpute
_pkgver=1.6.1
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
md5sums=('31c69f9fca734f88c995ad2ce79c053a')
b2sums=('707f3a1e235e58df9cc010988d9a37ef78c7ce42360e5975a90db194c95fa89792ab0ed50d12d643cb6489a7815b872aff6151d6f6277b513e43ae5187f3ca74')

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
