# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GlobalOptions
_pkgver=0.1.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=10
pkgdesc="Generate Functions to Get or Set Global Options"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=(MIT)
depends=(
  r
)
optdepends=(
  r-getoptlong
  r-knitr
  r-markdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5cda5a0e15be8bedcd21898ea59eae32')
b2sums=('77dca36b7a3aa0c2f83d7639f76db1eafee409da0c11d90c039a186edbaf3a4e835d33110179b6b004878673c93efd97b3c015ce0bf1cd71e2ed292df3188525')

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
