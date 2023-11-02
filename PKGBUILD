# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BUSpaRse
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="kallisto | bustools R utilities"
arch=(x86_64)
url="https://bioconductor.org/packages/${_pkgname}"
license=(BSD)
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
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7d2decd570fd518ad9a06c10a5ecffb3')
sha256sums=('e8c249061153745821dc85e2a2c3b7971146a870cbc68f80ae451d56de02893b')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
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
