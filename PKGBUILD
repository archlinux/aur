# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=ggrain
_pkgver=0.1.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A Rainclouds Geom for 'ggplot2'"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-cli
  r-ggplot2
  r-ggpp
  r-rlang
  r-vctrs
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ef5387c0885a3eaf367386be0c1c5bd5')
b2sums=('77be11e81932b4070e857e84ef4ecf46f00b9ece9d91d1f78601c4a29649b16f53567b7418202007286037eac7b973d940249e30e700d68e729be33cba0a9353')

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
