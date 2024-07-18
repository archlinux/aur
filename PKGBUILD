# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: sukanka <su975853527@gmail.com>

_pkgname=stars
_pkgver=0.6-6
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
  r-ncdfgeom
  r-ncmeta
  r-openstreetmap
  r-pbapply
  r-pcict
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
md5sums=('d5cbba3c504f488439100bfbaa27cac1')
b2sums=('280c443eb79e7ea85582816dda3f81fa1773370a37a4fcb39d55dce1bcf7089c1a56351e1fb9fd2c6ff67a14d845c0d9412d388ace32310e498934ced6ff11c7')

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
