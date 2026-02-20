# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=fauxpas
_pkgver=0.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="HTTP Error Helpers"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-httpcode
  r-r6
  r-whisker
)
optdepends=(
  r-crul
  r-curl
  r-httr
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3667a7b3f40b708a1012eb31ee71e6b9')
b2sums=('99c60a03134a12aca205b324b0200d8ef13a898492391c89939e4ec51b153e037a5289f15448df24f5f6558c63ed7c3bf38bca32983ce38d434e85fea976baa6')

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
