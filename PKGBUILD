# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=epimutacions
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Robust outlier identification for DNA methylation data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-annotationdbi
  r-annotationhub
  r-biocgenerics
  r-biocparallel
  r-biomart
  r-bumphunter
  r-ensembldb
  r-epimutacionsdata
  r-experimenthub
  r-genomeinfodb
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-ggrepel
  r-gridextra
  r-gviz
  r-homo.sapiens
  r-illuminahumanmethylation450kanno.ilmn12.hg19
  r-illuminahumanmethylation450kmanifest
  r-illuminahumanmethylationepicanno.ilm10b2.hg19
  r-illuminahumanmethylationepicmanifest
  r-iranges
  r-isotree
  r-matrixstats
  r-minfi
  r-purrr
  r-reshape2
  r-robustbase
  r-rtracklayer
  r-s4vectors
  r-summarizedexperiment
  r-tibble
  r-txdb.hsapiens.ucsc.hg18.knowngene
  r-txdb.hsapiens.ucsc.hg19.knowngene
  r-txdb.hsapiens.ucsc.hg38.knowngene
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-a4base
  r-biocstyle
  r-kableextra
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('694c3b410dc04c920577d6b16d905fe1')
b2sums=('aa049bfa3553767e84651b2e307ebd73711db57e961d214c5728ce1d53ca0ed21c9838242add7c952b2b62ae4190ce0bacda059a652f3e93dcf0832a8183bf3b')

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
