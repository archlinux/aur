# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggwordcloud
_pkgver=0.6.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A Word Cloud Geom for 'ggplot2'"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-colorspace
  r-ggplot2
  r-gridtext
  r-png
  r-rcpp
  r-scales
)
checkdepends=(
  r-testthat
  ttf-font
)
optdepends=(
  r-covr
  r-dplyr
  r-ggrepel
  r-knitr
  r-rmarkdown
  r-testthat
  r-tidyr
  r-wordcloud
  r-wordcloud2
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a10c84c635d64ba9de6ef08845c7bc23')
b2sums=('fa0a1b4da2dd63c1485c2528f61e7f195201cf9b1afb6ee41c1fde0fa5ef62de0f9ad74b342f08a7bc262be38dd6c41bb77d35fba31dbb309b508ad10470a1fc')

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
