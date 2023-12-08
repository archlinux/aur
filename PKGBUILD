# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=CNVMetrics
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Copy Number Variant Metrics"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Artistic2.0)
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
sha256sums=('95db84f879b5726ae2389ee54bafc8966fa9aeb9bf3c65cd4ffbdb665823c49a')

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
