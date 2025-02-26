# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=vioplot
_pkgver=0.5.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Violin Plot"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('BSD-3-Clause')
depends=(
  r-sm
  r-zoo
)
optdepends=(
  r-ggplot2
  r-knitr
  r-rcolorbrewer
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('03c6dffc695215ad9ade1bfe977dc75a')
b2sums=('badfff920867e124d2a406e39f07925e0c5349ce4b75eb3fd3f97b981a568f6866d242b888ad08dca7e451ac7bce15ba3bf811858a5ef4b31248335486712427')

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
