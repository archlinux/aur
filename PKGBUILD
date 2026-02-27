# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=simpleCache
_pkgver=0.4.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Simply Caching R Objects"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('BSD-2-Clause')
depends=(
  r
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a739960f4fc4b2a2fc3c2aab9f0375e5')
b2sums=('e89d175f14ee6c9a88118d81d5879440e1b651083a4cf00bcec72f609a5d26e63c39b372832689fbb20e1364b99fead0e838bb78ee57c65b24d450c1964f9e85')

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
