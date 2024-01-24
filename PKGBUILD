# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ggh4x
_pkgver=0.2.8
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Hacks for 'ggplot2'"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
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
md5sums=('495cbc3a454dc6e898094d384a58246c')
b2sums=('876a455d49bc6d846da00df4f82948e42ff6e8b37bbb2ba705c603203d55ec7526fd311ba5faf4f5f06474cf72b932eeb422f77a07b6d5f116de19214bf26847')

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
