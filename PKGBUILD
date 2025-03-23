# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=nipals
_pkgver=1.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Principal Components Analysis using NIPALS or Weighted EMPCA, with Gram-Schmidt Orthogonalization"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('83a9a55ff45c0c6bc1070930a8e83ac8')
b2sums=('4049546d73084002463d32bc5ea11313a366f0128bb5b951388d113af8cfd293e96fa4a9b3c52845dfeda3c43d11175a412fcaf8c20d0e8e272d15729f1e76d6')

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
