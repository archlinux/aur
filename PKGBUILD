# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=pRolocdata
_pkgver=1.46.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Data accompanying the pRoloc package"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-biobase
  r-msnbase
)
checkdepends=(
  r-summarizedexperiment
  r-testthat
)
optdepends=(
  r-proloc
  r-summarizedexperiment
  r-testthat
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e217ea5ab1b36862973db5694f80d8d6')
b2sums=('ace4e5af80f436c20b1e7e8cb9b9079ea353d813cdce98d6faad438958a32b8800517fe09a86308f22b184721ee4574f747da8fd99d630de5c5b7b1e2e985aba')

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
