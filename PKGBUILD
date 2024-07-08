# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Pranav K Anupam <pranavanupam@yahoo.com>
# Contributor: Alex Branham <branham@utexas.edu>

_pkgname=reprex
_pkgver=2.1.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('cddc2f1334ad703df88a18926432470f')
b2sums=('62cf9caf503472824e6f29dceb389248a644034654333c2e21cdd982eca868bf1d4f9cb7d8a52a85d3b79200d6a851f9389860843a7d69ebe2b23af229bed39a')

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
