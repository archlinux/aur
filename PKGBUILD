# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ggh4x
_pkgver=0.2.7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Hacks for 'ggplot2'"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
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
md5sums=('1a646ec43543f9e1a846b67739a72b64')
b2sums=('ae61a36231364b406416498dfb389207d1fbb9444c4abec846215ffff37aec824ad688b5ccfe88bbf6781ecbe3fc7af6fc997f9e74147147b95b0cc7947df4a7')

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
