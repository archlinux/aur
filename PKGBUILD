# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=synapter
_pkgver=2.30.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Label-free data analysis pipeline for optimal identification and quantitation"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-biobase
  r-biostrings
  r-cleaver
  r-msnbase
  r-multtest
  r-qvalue
  r-rcolorbrewer
  r-readr
  r-rmarkdown
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-brain
  r-knitr
  r-synapterdata
  r-testthat
  r-xtable
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a98619ff1d4662fcadb83e7b2370b934')
b2sums=('de8f85dda38cf97e6da6480c54b3efc08321cc5dfb88901d10c3a90c710fa92b23bde877b9e404fa61618505a7fd3b37c658331187694427e3a34d79d3cc81c1')

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
