# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=magpie
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="MeRIP-Seq data Analysis for Genomic Power Investigation and Evaluation"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(MIT)
depends=(
  r-annotationdbi
  r-aod
  r-biocparallel
  r-deseq2
  r-genomicfeatures
  r-genomicranges
  r-iranges
  r-matrixstats
  r-openxlsx
  r-rcolorbrewer
  r-reshape2
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-tress
)
checkdepends=(
  r-biocgenerics
  r-runit
  r-tbx20bamsubset
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-kableextra
  r-knitr
  r-rmarkdown
  r-runit
  r-tbx20bamsubset
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('019cf9b038353b96851fe65fa55f3d08')
sha256sums=('71b1fe8436fa3bd8037f002969f304b9588400cabcefafa3b851344ee914c662')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" Rscript --vanilla runTest.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
