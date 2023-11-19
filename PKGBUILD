# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ggh4x
_pkgver=0.2.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Hacks for 'ggplot2'"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(MIT)
depends=(
  r-cli
  r-ggplot2
  r-gtable
  r-lifecycle
  r-rlang
  r-scales
  r-vctrs
)
checkdepends=(
  r-fitdistrplus
  r-ggdendro
  r-testthat
  r-vdiffr
)
optdepends=(
  r-covr
  r-fitdistrplus
  r-ggdendro
  r-knitr
  r-rmarkdown
  r-testthat
  r-vdiffr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('450be3fd3d39699ae65648f7b2880240')
sha256sums=('eb7929b4c3167dce644b13d655144b2893e320072e7a998f07c37c4f7d9b2b3b')

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
