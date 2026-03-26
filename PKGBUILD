# Maintainer: Carson Buttars <carsonbuttars13@gmail.com>

_pkgname=dbarts
_pkgver=0.9-33
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
md5sums=('d097c09beb896fca53527eee85bc6b42')
b2sums=('f06b9393525716209c292c707f44a76463a692b3c450343392d539a8581d7518caa6a78489d53b69d167766514f6ff04fd7ec010f41fae3b4921bf99770bc573')

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
