# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=coro
_pkgver=1.0.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
md5sums=('20d535e6d36920c23c8e74442977806a')
b2sums=('b164beab9bf7818939e835071b0b85a162505bd0eff42f87b751385f99d990ee4907ac6ac8097c75147cec5b12882ab26ab9cac4ccbd46cd7e34119d1a32104a')

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
