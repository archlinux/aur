# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gllvm
_pkgver=1.4.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Generalized Linear Latent Variable Models"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-alabama
  r-fishmod
  r-mvabund
  r-nloptr
  r-statmod
  r-tmb
)
makedepends=(
  r-rcppeigen
)
optdepends=(
  r-corrplot
  r-gclus
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e07eb19b36dcc3af0525648d6492d150')
b2sums=('b16f0446c1ddb888bc38b0a30996d3d3299651320a4129a35025a32de9d36181b2859793a6f35d9140d6ef7427af4325f705db0e96866bda7cb68feeab2587c7')

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
