# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=magick
_pkgver=2.8.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Advanced Graphics and Image-Processing in R"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  imagemagick
  r-curl
  r-magrittr
  r-rcpp
)
optdepends=(
  r-av
  r-gapminder
  r-ggplot2
  r-gifski
  r-irdisplay
  r-jsonlite
  r-knitr
  r-pdftools
  r-rmarkdown
  r-rsvg
  r-spelling
  r-tesseract
  r-webp
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('029e625b79ee2aeed6ba5b60d0626907')
b2sums=('f4101b54e4451dbd1b63659b45ba515dd76a9dde5c671124dd6797c1957eab71b2a41eb221a28b0869ef837f86cef35c7ac04c7369d1501125d2f8db14f70d6c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" Rscript --vanilla encoding.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
