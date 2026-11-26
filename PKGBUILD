# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=UCSC.utils
_pkgver=1.10.0
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
md5sums=('d0db18906b37573e689d0af4b84dacc7')
b2sums=('7dbc69a34f167ed92bb5e7369e53953238fa3e57d3b783be6513e78453216e0b38a9aaad7b184c8281a10319e9ddf8e432995aa35377e3f9d269ab62ce4e8ad6')

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
