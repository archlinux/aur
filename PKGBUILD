# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=pRolocdata
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Data accompanying the pRoloc package"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL2)
depends=(
  r-biobase
  r-msnbase
)
checkdepends=(
  r-summarizedexperiment
  r-testthat
)
optdepends=(
  r-proloc
  r-summarizedexperiment
  r-testthat
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8aafd04221b21588077788ec79272e1a')
sha256sums=('f1c405105a5ea16a4343112d710842065722c6a773db904d6bbea789ced15e7e')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
