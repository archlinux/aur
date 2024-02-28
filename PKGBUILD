# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggraph
_pkgver=2.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="An Implementation of Grammar of Graphics for Graphs and Networks"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-cli
  r-dplyr
  r-ggforce
  r-ggplot2
  r-ggrepel
  r-graphlayouts
  r-igraph
  r-lifecycle
  r-memoise
  r-rlang
  r-scales
  r-tidygraph
  r-vctrs
  r-viridis
  r-withr
)
makedepends=(
  r-cpp11
)
optdepends=(
  r-covr
  r-deldir
  r-gganimate
  r-knitr
  r-network
  r-purrr
  r-rmarkdown
  r-seriation
  r-sf
  r-sfnetworks
  r-tibble
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fa46dccd79fad0bb9c6cc4ed3c365e35')
b2sums=('085c3bd1756451bd0e03fa70d6841163c4f74092fdfe973e664c667dab8a829d7fc2d95ca3502747513c75a17e827ef90b7d36fac72f4b6be6edcdfcb4f985cb')

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
