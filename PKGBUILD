# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=paletteer
_pkgver=1.7.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Comprehensive Collection of Color Palettes"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-cli
  r-prismatic
  r-rematch2
  r-rlang
  r-rstudioapi
)
checkdepends=(
  r-ggplot2
  r-ggthemes
  r-harrypotter
  r-oompabase
  r-palr
  r-pals
  r-scico
  r-testthat
  r-vdiffr
  r-viridislite
)
optdepends=(
  r-covr
  r-ggplot2
  r-ggthemes
  r-harrypotter
  r-knitr
  r-oompabase
  r-palr
  r-pals
  r-rmarkdown
  r-scico
  r-testthat
  r-vdiffr
  r-viridislite
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('59f9ff864c7a4f38d7a79c1719403eb9')
b2sums=('f2a4439d465f65da44f008d63f60bd34bf243b5f7cc31c5f40aff4e7b65a9698fe465c7ce27185104297c99446d76c65de1c6749ba6f07ae57d9f54229e60f40')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  # Honor upstream's skip_on_ci() for the visual snapshot test file.
  R_LIBS="$srcdir/build" CI=true NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
