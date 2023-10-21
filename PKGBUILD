# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=palr
_pkgver=0.3.0
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
md5sums=('b899763176205c856bc900ad6f3b6913')
sha256sums=('079455452139c6558d740c3dbca35b17f27a19cdcb2b18b427ef330a37996275')

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
