# Maintainer: waym0re <waym0re [at] icloud [dot] com>
_pkgname=box
_pkgver=1.2.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Write Reusable, Composable and Modular R Code"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=()
optdepends=(
  r-devtools
  r-knitr
  r-rmarkdown
  r-roxygen2
  r-rstudioapi
  r-shiny
  r-stringr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('49bf0f6e39fb08189d528b48a6d0e0d0')
b2sums=('83776a4eb077c6330f40bda0e10cef25c42612a3172eeab74908b785531bdf2741c68c6627a6585908640850eb213ecff83c19dfb488a85227b99797dce9f95c')

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
