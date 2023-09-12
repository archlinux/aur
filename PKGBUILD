# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ncmeta
_pkgver=0.3.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Straightforward 'NetCDF' Metadata"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL3)
depends=(
  r-dplyr
  r-rlang
  r-rnetcdf
  r-tibble
  r-tidyr
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-covr
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('45ad7c48462ee5c3139741f232199aaf')
sha256sums=('9376b17370aeadcfdc257c601ad9b4d834032d420ae93251620ae745806d87f0')

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
