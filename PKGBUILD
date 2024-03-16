# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=janeaustenr
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Jane Austen's Complete Novels"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r
)
optdepends=(
  r-dplyr
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1e7274a698306174dd9c405b4043ec71')
b2sums=('5a0926788195b9af36bb633ea1373092a070aaa06e47938cb6a43f4430502baa51b04f38aa44a8324350d2ad72a680abfba62b1765eced7f8e89e9a3a2079c73')

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
