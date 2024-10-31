# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=CNVMetrics
_pkgver=1.10.0
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
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('beeeff979554622def43fe96588bdf28')
b2sums=('05168a88fcde08828da20915e8dee1d6accb8809531ab93ec5aeffb40d19560900d0a9343dcee30e7c3cb6c98ef5c366696cf79935f11628d77cfa64e2695565')

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
