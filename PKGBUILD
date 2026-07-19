# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: sukanka <su975853527@gmail.com>

_pkgname=lwgeom
_pkgver=0.2-17
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Bindings to Selected 'liblwgeom' Functions for Simple Features"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  geos
  proj
  r-rcpp
  r-sf
  r-units
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-covr
  r-geosphere
  r-sp
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6a1425b7df4b8dda1301da13fdca56f4')
b2sums=('95bbe4eeb472060909eb892e7101249ca82ae9146e1fcd28e8059318e085649143d69460abfef97f8cdfa00f986eb4060aef561eeb77f2162331aff343f2b084')

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
