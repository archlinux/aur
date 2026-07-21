# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: sukanka <su975853527@gmail.com>

_pkgname=stars
_pkgver=0.7-3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Spatiotemporal Arrays, Raster and Vector Data Cubes"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=(Apache)
depends=(
  r-abind
  r-rlang
  r-sf
  r-units
)
checkdepends=(
  r-cubble
  r-dplyr
  r-ncmeta
  r-raster
  r-testthat
)
optdepends=(
  r-cairo
  r-cftime
  r-classint
  r-clue
  r-covr
  r-cubble
  r-cubelyr
  r-digest
  r-dplyr
  r-exactextractr
  r-fnn
  r-future.apply
  r-ggforce
  r-ggplot2
  r-ggthemes
  r-gstat
  r-httr
  r-jsonlite
  r-knitr
  r-lwgeom
  r-mapdata
  r-maps
  r-ncdfcf
  r-ncdfgeom
  r-ncmeta
  r-openstreetmap
  r-pbapply
  r-plm
  r-randomforest
  r-raster
  r-rmarkdown
  r-rnetcdf
  r-sp
  r-spacetime
  r-spatstat
  r-spatstat.geom
  r-starsdata
  r-terra
  r-testthat
  r-tibble
  r-tidyr
  r-tsibble
  r-viridis
  r-xts
  r-zoo
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5de2bee88edeb66ddd4f40a76f22bf28')
b2sums=('cdcb6dfcdc0e826e53a9cc2b2ab9ba5312fe1cf741cb8ec59262a7f7904eefb41998364558665c3d3b09022b3d8ee6788c95a4290cce0841d2ba4a27e9c74aee')

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
