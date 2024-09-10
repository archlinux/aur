# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=billboarder
_pkgver=0.5.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Create Interactive Chart with the JavaScript 'Billboard' Library"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-ggplot2
  r-htmltools
  r-htmlwidgets
  r-jsonlite
  r-magrittr
  r-rlang
  r-scales
  r-shiny
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-covr
  r-knitr
  r-rcolorbrewer
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('bdfacb2b873f17ada4c9850c4bba7d25')
b2sums=('7ea95575026c3be587c6749fa574c743ee31877031362529269f49b78e759498ec1bc614ba9a1f8dc926626e0da62a90c3269340c654e8df366ad53fba45f39c')

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
