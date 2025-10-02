# Maintainer: Carson Buttars <carsonbuttars13@gmail.com>

_pkgname=dbarts
_pkgver=0.9-32
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=5
pkgdesc="Discrete Bayesian additive regression trees sampler"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-stats
  r-methods
  r-graphics
  r-parallel
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-testthat
  r-knittr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('806847d704aa65a85b5e95e84afb393a')
b2sums=('c592a890acb4827bb9b870cfdf318ac2ea58b594acdcaa2ae36a5f6b0be46cda1a1811b4505a97239034907651f2d7d304e1e5c175c3b0c36b570f70ec0ea6c2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

# check() {
#   cd "$_pkgname/tests"
#   R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
# }

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
