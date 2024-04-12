# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=shinyCyJS
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Create Interactive Network Visualizations in R and 'shiny'"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-htmlwidgets
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b7023efef10fa2aa012650b4246ca2d4')
b2sums=('8ca69a980ab3bbc729ae39069c705accf7835bb4f8f37a858b7d9556ea63221ad6e0eab043c4af4b1433c615d33351bcde3ada15657b0d67765f56aada10331b')

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
