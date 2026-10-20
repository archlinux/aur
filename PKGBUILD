# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=harrypotter
_pkgver=2.1.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Palettes Generated from All \"Harry Potter\" Movies"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-ggplot2
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-hexbin
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8f953dc04e88e7723019bb17db132a71')
b2sums=('7a603a723969d5c29a65b8eb5a73eed5f6dfc218f95af7c0b9e0f9f7318ca3c0cf2eabef741f7ee352aa7e6cdf1b6c13ab98750715f057269c9d778bc6722b8f')

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
