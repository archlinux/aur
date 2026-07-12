# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=lsr
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Companion to \"Learning Statistics with R\""
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
  r-tibble
  r-withr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4c93a16b21fe97694d2d372a141cffd1')
b2sums=('6ab2b2fba42edee92753df2a987bb44e212f997c83d6ac283d138cda1a92ccb756e41f8dbbb8acd6ede1a88a41dd7e82ae107aa2bc166ee3f6364fb479c7e938')

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
