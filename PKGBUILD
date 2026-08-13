# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=CNVMetrics
_pkgver=1.16.0
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
md5sums=('10d776dc513e718fdac2f63da9e70a2a')
b2sums=('b3d58b4550001ddf9b180059ac07bd6d9c5dab6a4b9ef6968528ea240c080d4fbb20d4d7a2f1b2b16f4528f288957e2209cc32ce8a4a94cf24f2496956c0300b')

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
