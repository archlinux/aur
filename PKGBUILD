# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=circlize
_pkgver=0.4.16
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Circular Visualization"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-colorspace
  r-globaloptions
  r-shape
)
optdepends=(
  r-bezier
  r-complexheatmap
  r-covr
  r-dendextend
  r-gridbase
  r-knitr
  r-markdown
  r-png
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b71bcb6a045be622a67359ce537e1ee4')
b2sums=('fa9940c58f43fc0e277dc8445c85ea0f2ce8f18b5d7b3eb296c37608f3e9a9d010610f4a34d60ffbfb7d77e7987e0a1c7b5895122bdb4292a9235ab40a2e0d5c')

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
