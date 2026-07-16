# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=HarmonizR
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Handles missing values and makes more data available"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-doparallel
  r-foreach
  r-janitor
  r-limma
  r-plyr
  r-seriation
  r-summarizedexperiment
  r-sva
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1048e01aa57ef57376e4a631eaee127b')
b2sums=('01b40b52dd54379bee33d05e208a037de01555810c3d6786b0a92c9b4e63acbe470a6f303babbaefe72399b448abc37be7bfea6099a0bfca576f2ee7e405a959')

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
