# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CONSTANd
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
md5sums=('6337f6a248f820600a99fa9ef9fc1571')
b2sums=('66f3c5461bd804d4c90ee6b3802c6b74237ce6df1a089e153856d41b15d5c6f5394f659ff6684bb0d2f28f2b7e8c875a746b9a55e4b297920872202692bda912')

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
