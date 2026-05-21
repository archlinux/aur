# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=mwcsr
_pkgver=0.1.11
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Solvers for Maximum Weight Connected Subgraph Problem and Its Variants"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  java-runtime
  r-igraph
  r-rcpp
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-bionet
  r-dlbcl
  r-knitr
  r-mathjaxr
  r-rmarkdown
  r-roxygen2
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('649f080b03bedfb36eaef9165097f716')
b2sums=('c577cfedaf2d629815bee6dbf053c9711b96f59dd81e374c8e208d3aec11e8b7f3aa326a0366cf6756fd0a2371292f977219dd9978b5c397e9e2f794707e024f')

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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
