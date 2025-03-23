# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rsvg
_pkgver=2.6.2
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
md5sums=('02cc3a26aecd5bf6ab66a2b31c67a5bc')
b2sums=('5b6e8b995835419281589e8c9ea96dd5b09d45b8001254701e7efd15c2d79de2243ad8594021855f809e4c07a79d19ce84852e29cb80f32bd1c8f815b14bc0e9')

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
