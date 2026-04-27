# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rsvg
_pkgver=2.7.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Render SVG Images into PDF, PNG, (Encapsulated) PostScript, or Bitmap Arrays"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  cairo
  glib2
  librsvg
  r
)
checkdepends=(
  r-magick
  r-png
  r-testthat
)
optdepends=(
  r-ggplot2
  r-knitr
  r-magick
  r-png
  r-rmarkdown
  r-spelling
  r-svglite
  r-testthat
  r-webp
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ca3fd0083f2d37e453805fe2d986a4f3')
b2sums=('c8751b376595968e0c996dedf7eccfe32411d12359b83617df6c03ef64589bf82239e01cce7eac8bc58895e9143790361fa35c83a250488b51e64239ffe034d1')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

_check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
