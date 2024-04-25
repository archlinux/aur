# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggwordcloud
_pkgver=0.6.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
md5sums=('7ba9894b559065f9141fac1dc964eceb')
b2sums=('2e0e8740580dc75c8986f08c4071499faf97f47ed9ac5af11bf4ec993725aca5b03baf3e3240d4caeb0d2284086fb6a870ec8b8743118a43d8af53c103306ac0')

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
