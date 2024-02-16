# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rbokeh
_pkgver=0.5.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="R Interface for Bokeh"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-digest
  r-gistr
  r-hexbin
  r-htmlwidgets
  r-jsonlite
  r-lazyeval
  r-magrittr
  r-maps
  r-pryr
  r-scales
)
optdepends=(
  r-data.table
  r-knitr
  r-latticeextra
  r-lintr
  r-markdown
  r-rmarkdown
  r-roxygen2
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/Archive/$_pkgname/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('08b834ae99835c679c717c7c8537e196')
b2sums=('69bb6adb62b4e05bbffb5247423b6cbcffaeae09eefc150bcf888e8e1a5b027733ce80972e03a9aed95ab605cdcf3768bb9f366f36ef9c77269b5e75e1d58167')

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
