# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggwordcloud
_pkgver=0.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A Word Cloud Geom for 'ggplot2'"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL3)
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
md5sums=('8444d39059adaf9afed348bf472f5535')
sha256sums=('df0b5a275c29a8e441a8bf60d8008a60ed443119db6b11cab1ba61e2c8a599de')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
