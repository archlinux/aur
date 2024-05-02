# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=screenCounter
_pkgver=1.4.0
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
  r-zlibbioc
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
md5sums=('d41c087a96de1282f0ef7ebba97eba21')
b2sums=('6cbb46731b53438e724ac2b4df75e03a2be4744b70b97538327d70e734bb31adc077a029fd3f34a18359093fa311e8c9d224c437ecf725a7a5b5b94203edbd3d')

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
