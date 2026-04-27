# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GlobalOptions
_pkgver=0.1.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Generate Functions to Get or Set Global Options"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r
)
optdepends=(
  r-getoptlong
  r-knitr
  r-markdown
  r-testthat
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a384a77386d8847c4bdf72667bf32bed')
b2sums=('b8b4b1e084bf44283c3dd6f7fe61a8194094f9f3bcec31bbf5ef08f4ea25074b40852c43a85a071dd65fb29a4cab9b0a7055ccfe6e4f2b2f781ee71f0bf1f5d2')

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
