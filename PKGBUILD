# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=epimutacions
_pkgver=1.10.0
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
md5sums=('30df10a44d353e8f963c72c0822682e3')
b2sums=('b6bdb467e04f9db2731ef035c25c817c05fe20ff5a8eb21f97bc4cd2a98f9ffaf34f8c0f7fd196e08673d68ae0b1280d7eaff4dc3c2454cf3a251e1d8745e530')

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
