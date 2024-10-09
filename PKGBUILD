# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=BSgenomeForge
_pkgver=1.4.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Forge BSgenome data packages"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biobase
  r-biocgenerics
  r-biocio
  r-biostrings
  r-bsgenome
  r-genomeinfodb
  r-genomicranges
  r-iranges
  r-rtracklayer
  r-s4vectors
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-bsgenome.celegans.ucsc.ce2
  r-devtools
  r-genomicfeatures
  r-knitr
  r-rmarkdown
  r-rsamtools
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('db5c3ec5aad15c8291d37fc5e81260db')
b2sums=('fdd64227d523bd02c1ed003e6cf6742db15059eb695a2347744342b35a3207677fff46603472983a222240c877660d5b937a86a158e024e69497f6ca059ca833')

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
