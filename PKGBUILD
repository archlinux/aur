# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=FeatSeekR
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="an R package for unsupervised feature selection"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-pheatmap
  r-pracma
  r-summarizedexperiment
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-dmelsgi
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('23c49ca8d640009f029e1d88ae812f0c')
b2sums=('8a596c0e1a17588743805a813b51cf60901d3bf63f02a68174b59d2e71f3670e395db459523c12e4e4094ad35062071b05188a54ff8ffe8dcbc0e93220597423')

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
