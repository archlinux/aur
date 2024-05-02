# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=biodbNcbi
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="a library for connecting to NCBI Databases"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('AGPL-3.0-only')
depends=(
  r-biodb
  r-chk
  r-r6
  r-xml
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-covr
  r-devtools
  r-knitr
  r-lgr
  r-rmarkdown
  r-roxygen2
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('83f5f6c17da2dd16afca62673ad19868')
b2sums=('b738f0ea3d3b03d415bc8fe7fa2493f68793bd11f35946ab20185d4e0181a1d75c31f0827465f1d8c791b1eecca3d5f622b844d10cc7a4d3de8a28b045f3c69d')

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
