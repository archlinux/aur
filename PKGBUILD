# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=biodbNci
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('c1e7a71a07706082add092247ca45ed6')
b2sums=('0c9cb33bbd4e71fd67392b0596d8b054d3b1b8726b474bcf1570ebea8d9990e9adb68cfae5660cab5ceefacbcb47c9fb5e4816d894d038d2f4ddd74e3b68fba7')

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
