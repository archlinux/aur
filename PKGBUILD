# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=rdist
_pkgver=0.0.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Calculate Pairwise Distances"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  blas
  r-rcpp
)
makedepends=(
  r-rcpparmadillo
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e6f516837daa79c8fffb5e2569dc06b3')
b2sums=('f7062f4fe1352a8b74bba8309ba5ed3ae8c020b151deb6c24e74d6685cbc14aefcaf1eb08639c5ccdfdc0deb88afe02a2074432596fde895bca2f0f371c5f6d6')

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
