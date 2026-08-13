# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=screenCounter
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Counting Reads in High-Throughput Sequencing Screens"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-biocparallel
  r-rcpp
  r-s4vectors
  r-summarizedexperiment
  zlib
)
checkdepends=(
  r-biostrings
  r-testthat
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-biostrings
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b0b4c0eb8ce3144339b358acac31f555')
b2sums=('b2b8786e51d2beb31a0f48bbfbb604bd9638e99bf4ee7b08db0639033e554d03b1b88ded603891952855a13280afc3fe40cb62c190e7dbd8fc13c59fd3f24639')

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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
