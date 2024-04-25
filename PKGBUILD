# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rsvg
_pkgver=2.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
md5sums=('0936b7aab088f55d727d0827a53e89d0')
b2sums=('46414dfeedfb308963e64c9c645d053cfa1e71592d548c1d924fdf7051b40fd6e7a0e219bcec7e5184d22648329cb7bdff051a6cb5d1bc5859a7af4230e60e5f')

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
