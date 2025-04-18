# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=combi
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Compositional omics model based visual integration"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-alabama
  r-bb
  r-biobase
  r-cobs
  r-dbi
  r-ggplot2
  r-limma
  r-nleqslv
  r-phyloseq
  r-reshape2
  r-summarizedexperiment
  r-tensor
  r-vegan
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('919711124559c405f4d09eb040b6c402')
b2sums=('a6464c0e39c12772863d70108845cb88e2ff162e489cbffc7ac2a1e4e02a58b2be1e1a735e73a42392b65be5206b94e4c12755408577183596edd0c176b10037')

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
