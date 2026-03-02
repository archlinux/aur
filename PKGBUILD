# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=simpleCache
_pkgver=0.5.0
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
md5sums=('6254c246b90cca56202361158f2432ea')
b2sums=('142ee9919efdfae2adee6e06b36cbd30b335a2920827f5463c69fb2cb713b7968b3d215297126c9d2e127a20bc01f64cf9ed2dec504f86145b04cb469c7894c1')

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
