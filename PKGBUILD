# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gganimate
_pkgver=1.0.9
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A Grammar of Animated Graphics"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-cli
  r-ggplot2
  r-glue
  r-lifecycle
  r-progress
  r-rlang
  r-scales
  r-stringi
  r-transformr
  r-tweenr
  r-vctrs
)
checkdepends=(
  r-gifski
  r-magick
  r-testthat
  ttf-font
)
optdepends=(
  r-av
  r-base64enc
  r-covr
  r-gifski
  r-htmltools
  r-knitr
  r-magick
  r-ragg
  r-rmarkdown
  r-sf
  r-svglite
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9be9453ae809aa81f1722f2215681edb')
b2sums=('d52f9ec98be6b095ae5f735c23525d76174b61ada1ef88ac7c9bc767396757903d6214849293bfc9318992fb46e356b6e59368a247b6ef20b27644fe15d4fb9b')

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
