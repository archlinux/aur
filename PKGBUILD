# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=billboarder
_pkgver=0.4.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Create Interactive Chart with the JavaScript 'Billboard' Library"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(MIT)
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
md5sums=('46c766c3238792e3bc6b3e59bd9c7bf6')
sha256sums=('766201c8a09b56d7c35ff69862ae2315fe8bf209d26aae5fb20957cb690cd22f')

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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
