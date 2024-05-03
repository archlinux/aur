# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=RgnTX
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Colocalization analysis of transcriptome elements in the presence of isoform heterogeneity and ambiguity"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-genomeinfodb
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-iranges
  r-regioner
  r-s4vectors
  r-txdb.hsapiens.ucsc.hg19.knowngene
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('cb590ec8545dd2797c50bbd08e416503')
b2sums=('acbfba92fe76ef69bf7a0823082c7407eb7213063563bc4e258aa54e3dd49118e6fdc1d02028aec96ff780fbcf3ae60cf83b77105d0ad151cd03bef1631c78a7')

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
