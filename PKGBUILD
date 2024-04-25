# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=biodbNci
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=5
pkgdesc="a library for connecting to the National Cancer Institute (USA) CACTUS Database"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('AGPL-3.0-only')
depends=(
  r-biodb
  r-chk
  r-r6
  r-rcpp
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
md5sums=('6dcd43d5c282054f4edfef08a2f597cd')
b2sums=('04800016e1acf8ae14fa5786ac68050cd20dc5e64c5eb1addd29a312ecbe236b93ec5cd1b1c5b651f48382010eaf575ecf271a678835d6fcc7c364451019cad0')

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
