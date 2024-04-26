# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=marinerData
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="ExperimentHub data for the mariner package"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-experimenthub
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-experimenthubdata
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7875113ebb6baaaed6eb6fc762ba92ca')
b2sums=('841a8d0eafa20ad68553a74f66ccc4d6ce7ddc9d3aa94c14570b18022a4375dfa05ac7d86460fd57b6d9c3c67aeae2468f82f8e44cd52a66d87437e0fc3ff806')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
