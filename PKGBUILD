# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=biodbHmdb
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="a library for connecting to the HMDB Database"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('AGPL-3.0-only')
depends=(
  r-biodb
  r-r6
  r-rcpp
  r-zip
)
makedepends=(
  r-testthat
)
checkdepends=(
  r-xml2
)
optdepends=(
  r-biocstyle
  r-covr
  r-devtools
  r-knitr
  r-lgr
  r-rmarkdown
  r-roxygen2
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0333d0ac49b6de03426e7709fa2ca1ac')
b2sums=('e78c2a009f2538957d661dacf408dd9c42844768def6bc24f62e8cbb0b11e056f9154af6a1fab50f2402e60dac9f48fb9d203fbf0ec9d978eefc50c021cc69be')

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
