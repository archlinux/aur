# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: sukanka <su975853527@gmail.com>

_pkgname=stars
_pkgver=0.7-2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Spatiotemporal Arrays, Raster and Vector Data Cubes"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=(Apache)
depends=(
  r-abind
  r-classint
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
  r-clue
  r-cftime
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
md5sums=('0016cf9d2ba44160eba72d037dc75fc0')
b2sums=('8463bb44c52ba5938ce554b31184a22a2449624978bba60fcbf4689fb84d6815a4889abb3ee1fab8d361b3edd168498931365bac01c350d53b2ed77748cd5c9a')

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
