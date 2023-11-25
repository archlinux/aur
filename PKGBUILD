# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=dashboardthemes
_pkgver=1.1.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Customise the Appearance of 'shinydashboard' Applications using Themes"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(MIT)
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
sha256sums=('cc80bcd4b66d2418fe08636a25425083574d406e4bd9dfa8d170663aeb23717a')

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
