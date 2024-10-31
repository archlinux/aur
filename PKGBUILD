# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CONSTANd
_pkgver=1.14.0
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
md5sums=('86711e287452f21bc57def13d529a624')
b2sums=('1573937ff34cd14b0b0672e326d0f314111e92e4172b2ad368d26abc714a0d6ae2754a309994aa58e29178196af58b05d157dfec47adb9b6ef3ca0178b885abc')

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
