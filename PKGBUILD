# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: sukanka <su975853527@gmail.com>

_pkgname=stars
_pkgver=0.6-5
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
md5sums=('dfaff96a4c88f6381c6761e4ea275370')
b2sums=('e758cbcb57588ba24a7087e84bf06eb5c89c9cefc40a0436036f0b95c5d6865c09d6268c32e5e0be1f074e1fc4eaa717d5487445ad17c378cb47acd53d09eb4d')

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
