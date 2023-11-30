# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=dqrng
_pkgver=0.3.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Fast Pseudo Random Number Generators"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(AGPL)
depends=(
  r-rcpp
)
makedepends=(
  r-bh
  r-sitmo
)
checkdepends=(
  r-mvtnorm
  r-testthat
)
optdepends=(
  r-bench
  r-knitr
  r-mvtnorm
  r-rmarkdown
  r-sitmo
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6f3ee0d3b89f90deb993032e8185e487')
sha256sums=('cd02ca210aa40db5a3dfff317ab721c0eea3a94d6effdaf1068a527710393e9c')

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
