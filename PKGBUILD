# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=mwcsr
_pkgver=0.1.12
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
md5sums=('e4c575fcc849c713a99ec08a02ed3d16')
b2sums=('f5e5dce76eb0128e681ed93b7c19feaceada2b24a3ecf3da8eec979223cb507059087b83b1673b3a4cb82deea5f8fff59ae3dec7ec7d731447ec6f25d04f5b32')

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
