# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=alabaster.se
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Load and Save SummarizedExperiments from File"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(MIT)
depends=(
  r-alabaster.base
  r-alabaster.matrix
  r-alabaster.ranges
  r-biocgenerics
  r-genomicranges
  r-iranges
  r-s4vectors
  r-summarizedexperiment
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-jsonlite
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('25133d88cc71ec6029229772a1eee0e8')
sha256sums=('9d37f71146259c376c7d080c99e18cf7c9daf3d6cea26007189385459a6f3b93')

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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
