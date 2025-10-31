# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=UCSC.utils
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Low-level utilities to retrieve data from the UCSC Genome Browser"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-httr
  r-jsonlite
  r-s4vectors
)
checkdepends=(
  r-dbi
  r-rmariadb
  r-testthat
)
optdepends=(
  r-biocstyle
  r-dbi
  r-genomeinfodb
  r-knitr
  r-rmariadb
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('88d9dd1d3ab8c5597926f4da7a3fabf4')
b2sums=('7ea0e2b0e09bf5276128463d6d9c61e200354c808a090b67ebbf4b276e60aa5f096b880eb83b6a93ccdd1693317688b93ea49445140e2232288d82893485ea1b')

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
