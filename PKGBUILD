# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=coro
_pkgver=1.0.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="'Coroutines' for R"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-rlang
)
optdepends=(
  r-knitr
  r-later
  r-magrittr
  r-promises
  r-reticulate
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('43de2145fa31d857e57ba72800c114cb')
b2sums=('b51ce96d1bb2846eee9a6d9f8e81e2b7701caf3ed0a76939a0d600ed7de4ab3d75b8a5fc8c64692f8fa7e8fd918f1b20d5941b9d803489a44a1f9797563ed7ef')

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
