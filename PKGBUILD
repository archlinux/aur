# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ResidualMatrix
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Creating a DelayedMatrix of Regression Residuals"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
depends=(
  r-delayedarray
  r-s4vectors
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocsingular
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('76eaee4311380f83265d9b5ecacd7e49')
sha256sums=('bbb066105053c04b4d2d5fdbda6b2d2eb708c8e80272354bc1dc3dbf7a38fe1a')

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
