# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=CNVMetrics
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Copy Number Variant Metrics"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biocparallel
  r-genomicranges
  r-gridextra
  r-iranges
  r-magrittr
  r-pheatmap
  r-rbeta2009
  r-s4vectors
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ebb4f847744aaddcc125d870b1a67154')
b2sums=('e6a350c3fd5685ea76a3856bc0e2c199aec668c716d3ea5bb483050d198e894d85b1b7fe8e93ea79b65934403eec9b27dcf53087511d91b11638e136d660f844')

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
