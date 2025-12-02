# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=mwcsr
_pkgver=0.1.10
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
md5sums=('90cbd9678634bfe7017c93c11c0a4ff3')
b2sums=('07a1f5725c1660854b3727a7d8c3c6bc058a0c5d836222d1a075f461cd31927f8d51860129e25ceb92f2443c44ea557fbd94eb8b65753e9548872e9cf0f2955d')

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
