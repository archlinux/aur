# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ggh4x
_pkgver=0.3.0
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
md5sums=('e527f27c933818bc6490b209d8dba54f')
b2sums=('539eaa579c9cdeb71ff7aea59c43b6410d25fc400b4e54e6b57c4e21fa1030e1bdd607ce018fcc5ec878960a345b729b38e8e58ab4039a90af58c910e0b4bf94')

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
