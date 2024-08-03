# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BUSpaRse
_pkgver=1.18.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="kallisto | bustools R utilities"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('BSD-2-Clause')
depends=(
  r-annotationdbi
  r-annotationfilter
  r-biocgenerics
  r-biomart
  r-biostrings
  r-bsgenome
  r-dplyr
  r-ensembldb
  r-genomeinfodb
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-iranges
  r-magrittr
  r-plyranges
  r-rcpp
  r-s4vectors
  r-stringr
  r-tibble
  r-tidyr
  r-zeallot
)
makedepends=(
  r-bh
  r-rcpparmadillo
  r-rcppprogress
)
checkdepends=(
  r-testthat
  r-txdbmaker
)
optdepends=(
  r-biocstyle
  r-bsgenome.hsapiens.ucsc.hg38
  r-ensdb.hsapiens.v86
  r-knitr
  r-rmarkdown
  r-tenxbusdata
  r-testthat
  r-txdb.hsapiens.ucsc.hg38.knowngene
  r-txdbmaker
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5f9449a03f5fa044e500cb4808b1ae93')
b2sums=('f29e86c7bce91f5bc533bb513701badedec6ffab3774a69c86282a6dda78c8376cc034930a7a1e000ed2b4959caf53cb3c6212f2d49c749400cc84a45d0cb753')

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
