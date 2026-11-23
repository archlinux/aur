# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=hoardr
_pkgver=0.5.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Manage Cached Files"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-digest
  r-r6
  r-rappdirs
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ff1fd6ecc6acadcf70250f44902ecaab')
b2sums=('20c036dcda179c0c799ac63a5a63f480ef5fe7e00a54238892689b17402991a6e6d406f568d160154bdb3d035c681d0970191c6fd63c4f30693ceb002d900371')

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
