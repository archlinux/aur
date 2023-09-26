# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rsvg
_pkgver=2.5.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Render SVG Images into PDF, PNG, (Encapsulated) PostScript, or Bitmap Arrays"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(MIT)
depends=(
  cairo
  glib2
  librsvg
  r
)
optdepends=(
  r-ggplot2
  r-knitr
  r-magick
  r-rmarkdown
  r-spelling
  r-svglite
  r-webp
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('cd4f97f9721a1bab32b1bcfc6d4ca154')
sha256sums=('b5ddafaefe0ab8f4cb5305dcbc8a9cbafaa5210c2c51cc28480a21a2210c23be')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
