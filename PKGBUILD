# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pdftools
_pkgver=3.4.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Text Extraction, Rendering and Converting of PDF Documents"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  poppler
  poppler-data
  r-qpdf
  r-rcpp
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-png
  r-tesseract
  r-testthat
  r-webp
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('35ae65b500d0168bad709a6d83eb3073')
b2sums=('e7c0b5b615eb6596cefdf4b93f700fffaabbb8e04b2fa92123bc3d54720c0094a02e6ca87c02be31a2bca31b6f68a67877f5a6304b50ecbe5c476bf27d92b474')

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
