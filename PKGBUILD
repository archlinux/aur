# Maintainer: Carson Buttars <carsonbuttars13@gmail.com>

_pkgname=dotty
_pkgver=0.1.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="The Unpacking Dot Operator"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
checkdepends=(
  r-testthat
)
optdepends=(
	r-codetools
	r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7441850c335098b37116050f0f98b08e')
b2sums=('2729049683ab7ffa899b9b9396a9abc07198ff4076f70c3f76e5a094d0992dc20a8dd71fc9ebf78cd170a9c38fe518c23bbf7a31c8fe16435ab1b98d45df4ae8')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

#check() {
#  cd "$_pkgname/tests"
#  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
#}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
