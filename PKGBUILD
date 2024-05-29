# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Ecume
_pkgver=0.9.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Equality of 2 (or k) Continuous Univariate and Multivariate Distributions"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-caret
  r-dplyr
  r-e1071
  r-kernlab
  r-magrittr
  r-pbapply
  r-spatstat.univar
  r-transport
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('55ce7e7008665eeac32a0e93eff6be6a')
b2sums=('215e510121785b4fb44e9067777b93c2fc1910046eebca046b4855a5f2743f8eeec70c6e634842907606df8a2266e1d04b666fecd9449fa9f6d30593ab902a44')

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
