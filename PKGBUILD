# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RJSONIO
_pkgver=2.0.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Serialize R Objects to JSON"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('BSD-3-Clause')
depends=(
  r
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('358d7433ec8da681b17c4e29994f8d12')
b2sums=('c62dbb375d810f5bfffa87212fa534fa9712beb5c2e6c6e129d750de781eba14951660e38cb3d7824f34e15ff228dee5614d65f75eda27c9db2bfa24fdbb3b6e')

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
