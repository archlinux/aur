# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=harrypotter
_pkgver=2.1.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Palettes Generated from All \"Harry Potter\" Movies"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(MIT)
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
sha256sums=('192d1256ba770a66a6136647147ee822f249895543119980cb8c927b33d87ac8')

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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
