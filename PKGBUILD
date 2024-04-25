# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=harrypotter
_pkgver=2.1.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Palettes Generated from All \"Harry Potter\" Movies"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-ggplot2
  r-gridextra
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-hexbin
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f032c91d396ce69e965431316883473d')
b2sums=('dbfb77a38a4028d011aa8e36ee744e34ef5a0d75b59aedaff28b3328704ab19b125b480b567bdc8022180665a9534c51cad653c58f334ead2127480015d4ba5c')

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
