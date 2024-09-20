# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rsvg
_pkgver=2.6.1
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
md5sums=('e40b6b3bef8c9a9bc5356e3b4b6bebda')
b2sums=('219c7b7c89edf77747fadaa946533b05abf962c9bfeb0a1033a16e9816241865e58457e13285e45e7a7914c591652cfa11d7ebbbd96a00b0beeb3e4409892f7f')

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
