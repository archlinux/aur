# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=grpreg
_pkgver=3.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=0
pkgdesc="Regularization Paths for Regression Models with Grouped Covariates"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-splines
  r-survival
  r-tinytest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('51f023fe40d1aabc705eec86d42c73f5')
b2sums=('28841c910a6aac91e30691a7b328f97a86064dd323e1ee15ccf95553176148a69431a2c56de8008477577475f52ea334429dad192a617af6062528e0a0132faf')

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
