# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=HERON
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Hierarchical Epitope pROtein biNding"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
depends=(
  r-data.table
  r-genomicranges
  r-harmonicmeanp
  r-iranges
  r-limma
  r-matrixstats
  r-metap
  r-s4vectors
  r-spdep
  r-summarizedexperiment
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
md5sums=('9c146a8d99bada338098732e1de5a5e2')
sha256sums=('b1a365540c32dac743dc87e5428e26692fd7174ec8a76f014d19e727ab60e34b')

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
