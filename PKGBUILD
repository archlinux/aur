# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=CNVMetrics
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
  r-xvector
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e4cfc19a9efa99bb675f57886e1b990a')
b2sums=('e7c8dd665ec370d11f7cd96e45e501257b11577d15cc613b1795695670f2b6933997075e8e536deacd3cf861549e8abb4479951b7c77cbf7e02571dd01295517')

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
