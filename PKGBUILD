# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=magick
_pkgver=2.8.6
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
md5sums=('c3ee9f489208cc3bca4cbefdf8f4dfb5')
b2sums=('d4947d3c20429f79066dd2e9addd23a13fe61fdb2af59e8971276da9cc68c7b0253ab43cd76202ce448ce3e60ddfb4e6541559290df44f87d705fdf9e1b95730')

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
