# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gganimate
_pkgver=1.0.11
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
md5sums=('66d42eedb4dc79f23558e016fac07b63')
b2sums=('0ba8988eb5489cd3d7f5c256e700126640042281944c37aac7af921c8af0e99f23a3a60d1e9f66734846d559a6ad66587ba206edd8569a35a318c757ed2c0806')

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
