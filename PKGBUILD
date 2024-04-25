# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ClustIRR
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Clustering of immune receptor repertoires"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
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
b2sums=('91a1392f45f76d4c865931c8c48e05fc7fe033a8d406a66224260398c330925268c53e2a731372efb1ffb39c765df1e0f6d4432295346cb59d95b13ae530b3cb')

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
