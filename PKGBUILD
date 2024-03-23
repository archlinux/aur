# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=mgcViz
_pkgver=0.1.11
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Visualisations for Generalized Additive Models"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-gamm4
  r-ggally
  r-ggplot2
  r-gridextra
  r-matrixstats
  r-miniui
  r-plyr
  r-qgam
  r-shiny
  r-viridis
)
checkdepends=(
  r-hexbin
  r-testthat
)
optdepends=(
  r-knitr
  r-rgl
  r-rmarkdown
  r-testthat
  r-webshot2
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8b1f6454bc0d2d2a91f638ed6a25cfa6')
b2sums=('02c27902655eadd9be2b2b7a11b767cbf7d02baf784e4fb03d4428ee52743dd999643a1c70d491eb23dc6617a0133638244b833c3eb893aff29fd61d0e9561e1')

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
