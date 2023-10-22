# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=INTACT
_pkgver=1.0.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Integrate TWAS and Colocalization Analysis for Gene Set Enrichment Analysis"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
depends=(
  r-bdsmatrix
  r-numderiv
  r-squarem
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1a64972b6c12f98b3246e1ec19e4a36d')
sha256sums=('aa03f9c665530c65e4bef5866f13f38c561bbfc34f86dceff4dec0e26bfb68ee')

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
