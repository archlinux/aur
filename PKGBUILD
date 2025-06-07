# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=magick
_pkgver=2.8.7
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
md5sums=('acbeda85c35cc1c125dcd5961086ae4b')
b2sums=('04b4d105882919c5e1d0133124c8ad4e22dcb659acb1e7ee564facd1ab631c0f1457695553a479a2ec624a555eb700f6e9fbdb29def92736db84d17b82869e0b')

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
