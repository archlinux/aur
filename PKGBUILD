# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=workflows
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Modeling Workflows"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-cli
  r-generics
  r-glue
  r-hardhat
  r-lifecycle
  r-modelenv
  r-parsnip
  r-rlang
  r-tidyselect
  r-vctrs
  r-withr
  r-sparsevctrs
  r-recipes
)
optdepends=(
  r-butcher
  r-covr
  r-dials
  r-knitr
  r-magrittr
  r-modeldata
  r-rmarkdown
  r-testthat
  r-glmnet
  r-probably
  r-rsample
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c41e3bd73dde289ba7aae98fdf95aac8')
b2sums=('eccb8bf321de5238ceff258af37d056dfa32e0f3264d3ecddd66019a2dfd28631b0c8216db15bea5ca4df613ae1b41df6a8f7bd5389095c21de81b0fd2023784')

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
