# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ClustIRR
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Clustering of immune receptor repertoires"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
depends=(
  r-future
  r-future.apply
  r-igraph
  r-stringdist
  r-visnetwork
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-ggplot2
  r-ggrepel
  r-knitr
  r-patchwork
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ffd1884844b297c2e593e465a776fb6d')
sha256sums=('f54c2788eed171e691476b2113665749eb5880c10c138aec71f07577f135b8e7')

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
