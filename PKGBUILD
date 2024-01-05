# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=BSgenomeForge
_pkgver=1.2.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Forge BSgenome data packages"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=(Artistic2.0)
depends=(
  r-biobase
  r-biocgenerics
  r-biostrings
  r-bsgenome
  r-genomeinfodb
  r-iranges
  r-rtracklayer
  r-s4vectors
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-devtools
  r-genomicfeatures
  r-genomicranges
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7a8ad7be8dbfe9034eb38bb87bf92e31')
b2sums=('4f5e7c70f3a56423d87a5b881329eea8f92735c0a3c650552d021e52ee9c646d961f169099c7c990af5fdb68ddffa0bc7040dbbf05319ff18adbb11a6e01e878')

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
