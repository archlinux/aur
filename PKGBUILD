# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=import
_pkgver=1.3.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="An Import Mechanism for R"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=(MIT)
depends=(
  r
)
optdepends=(
  r-knitr
  r-magrittr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0e1640048136d1b5cb24025337698a23')
b2sums=('0145cab3a62ef017e4427960580415c41c08a747f6a95782a07025eec27e30c624e25d193ac3e973e1fffa7c332976ea73c4f0e1a6f57460037708f366086090')

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
