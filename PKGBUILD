# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=VDJdive
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Analysis Tools for 10X V(D)J Data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biocparallel
  r-cowplot
  r-ggplot2
  r-gridextra
  r-iranges
  r-rcolorbrewer
  r-rcpp
  r-s4vectors
  r-singlecellexperiment
  r-summarizedexperiment
)
checkdepends=(
  r-breakaway
  r-testthat
)
optdepends=(
  r-biocstyle
  r-breakaway
  r-covr
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('547c9385b4dbcadab17a4044fd58218c')
b2sums=('5a5269e15c848916f502ba14a315f9c0142335fbbf4e3df89436d52124e05aed9ddcefdf3f9797b15043ebe4fc9c910a59c840a8215b9a325e5f81be40da6790')

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
