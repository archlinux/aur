# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=magick
_pkgver=2.7.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Advanced Graphics and Image-Processing in R"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(MIT)
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
md5sums=('5c399ea81ad88db801160082d83c791c')
sha256sums=('69b6162d39b71e1de16c641c3e6ccc747d226017e6540e4aa0a29376bffe9da2')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
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
