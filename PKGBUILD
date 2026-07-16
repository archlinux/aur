# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=CTdata
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Data companion to CTexploreR"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-experimenthub
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-dt
  r-knitr
  r-rmarkdown
  r-singlecellexperiment
  r-summarizedexperiment
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fa261025afe905e7b207d898d64f9661')
b2sums=('9e2e2b989ecc09b6d46bb8f38d96375ec4da29ff11e7bb1d53d8bb33b6b6fc82360c75910c325c8af4d8c55b3bd4b6c2689fc4dbf61f8010cbe5608fcdeea884')

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
