# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CONSTANd
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Data normalization by matrix raking"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('NPOSL-3.0')
depends=(
  r
)
optdepends=(
  r-biocstyle
  r-cairo
  r-ggplot2
  r-gridextra
  r-knitr
  r-limma
  r-magick
  r-rmarkdown
  r-tidyr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7bd0ff21805e648a4daf309b1ad720d2')
b2sums=('f98b47e27a8d9867344eda0dbd7a983178fcbd053eb4b89925bbac36d381fbc9a8b6664b001046c5e5807c0a6ebad9416770ca14d5b808b39296d88e09de5f42')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
