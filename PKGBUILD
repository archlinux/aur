# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Pranav K Anupam <pranavanupam@yahoo.com>
# Contributor: Alex Branham <branham@utexas.edu>

_pkgname=reprex
_pkgver=2.1.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Prepare Reproducible Example Code via the Clipboard"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  pandoc
  r-callr
  r-cli
  r-clipr
  r-fs
  r-glue
  r-knitr
  r-lifecycle
  r-rlang
  r-rmarkdown
  r-rstudioapi
  r-withr
)
checkdepends=(
  r-styler
  r-testthat
)
optdepends=(
  r-covr
  r-fortunes
  r-miniui
  r-rprojroot
  r-sessioninfo
  r-shiny
  r-spelling
  r-styler
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f9c998d2dc355b00fbde58c04d97d220')
b2sums=('8a54ccb446850f9c209a11146513e58798877165bbf36d8f810f1c7cc1ed8c972812b7dc6a1114422674917a56549342db300e0079c4b29d7cae7415f2baf696')

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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
