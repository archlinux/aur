# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=pRolocdata
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('8aafd04221b21588077788ec79272e1a')
b2sums=('853a0acb9eab2a6bf4b0224fb9a42eb64b41a003739e5b0668ab3f12e3531dced338c7a2d17ee8375908cbdd4194b855e795e70b54520b4193f2f15509a81c6b')

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
