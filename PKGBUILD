# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pkgname=ggrepel
_pkgver=0.9.7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Automatically Position Non-Overlapping Text Labels with 'ggplot2'"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-ggplot2
  r-rcpp
  r-rlang
  r-s7
  r-scales
  r-withr
)
checkdepends=(
  r-testthat
  r-vdiffr
  ttf-font
)
optdepends=(
  r-devtools
  r-dplyr
  r-ggbeeswarm
  r-ggpp
  r-gridextra
  r-knitr
  r-magrittr
  r-marquee
  r-patchwork
  r-prettydoc
  r-readr
  r-rmarkdown
  r-sf
  r-stringr
  r-rsvg
  r-svglite
  r-testthat
  r-vdiffr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c4ecd7127235addd35ac700d423b6673')
b2sums=('b7769d14cd7b0a54d9c69c85a8df2daa1f53c4537dde9a210e5880b44cd6e9368a24f9f1b4a71cfd3b32995fa2f7859081cb53dfc91b9482b779a3da63696574')

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
