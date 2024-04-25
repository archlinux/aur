# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=dashboardthemes
_pkgver=1.1.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Customise the Appearance of 'shinydashboard' Applications using Themes"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-htmltools
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-covr
  r-glue
  r-knitr
  r-lintr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0412aef1b3d96fb04a725bfeb02938d2')
b2sums=('da4d9863041539bf60dc4cf9e5a26bfe17bec60d6cf8817a0cb3598891c9e16ec0051b28aad90132836a04f3ceaa2f9dba9aa317fe06ff25146536f72edf1170')

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
