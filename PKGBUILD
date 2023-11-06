# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=palr
_pkgver=0.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Colour Palettes for Data"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL3)
depends=(
  r
)
checkdepends=(
  r-raster
  r-stars
  r-testthat
)
optdepends=(
  r-covr
  r-knitr
  r-raster
  r-rmarkdown
  r-stars
  r-testthat
  r-viridis
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a58440cad133ba506d936d997b82cdc0')
sha256sums=('c65d3da61f73f17cfcb8aa65a3acfbd193f3b029addd5d5247a0a9ab2a395eb5')

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
