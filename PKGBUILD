# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=BSgenomeForge
_pkgver=1.2.3
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
md5sums=('f6b0c95390692557860c977b1eba0f0c')
b2sums=('4b0ba548243f7afb2a5bcb019032b13de5c12ae6d7306686ff2cdc760b61224e71fc8be88680218890078f50e9d911fc3502fa50b4ce074c6c76871d9e211d81')

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
