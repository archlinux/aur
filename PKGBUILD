# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=UCSC.utils
_pkgver=1.8.0
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
md5sums=('dd0c6c3e0db772995886e0cc65debb9f')
b2sums=('95e2433c69db0dc5b6c3d8db6746295e6fe1e5eff1a5d3a84c67a86e77cbf2c2bdf3b6003cb182be13a0b40227b05562aa3df64505a7c65d7f5340588eb5cbb0')

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
