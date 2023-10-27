# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggwordcloud
_pkgver=0.6.1
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
md5sums=('7ba9894b559065f9141fac1dc964eceb')
sha256sums=('b7bbbc02eff4f6519edc0e854b3bd4d9f9fc34e61ebc4e540869814ffdbe7db9')

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
