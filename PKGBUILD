# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=nipals
_pkgver=1.2
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
md5sums=('5aa6c6a75ba5429f196ee05fd1197122')
b2sums=('5a895737ddb4e03e99a9c293e946f13fd775736562c34afd2eb8ebb3897d5da9ce88d051114e92ee47cf578f0cf684976385fe70f042e92290f41a636801b874')

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
