# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=syntenet
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Inference And Analysis Of Synteny Networks"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biocparallel
  r-biostrings
  r-genomicranges
  r-ggnetwork
  r-ggplot2
  r-igraph
  r-intergraph
  r-pheatmap
  r-rcolorbrewer
  r-rcpp
  r-rlang
)
makedepends=(
  r-testthat
)
checkdepends=(
  r-xml2
)
optdepends=(
  r-biocstyle
  r-covr
  r-ggtree
  r-knitr
  r-labdsv
  r-networkd3
  r-rmarkdown
  r-rtracklayer
  r-testthat
  r-xml2
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('37b2833ca59ffa90209216f5fd842d49')
b2sums=('18a74408f5df4936ddfd10ea9e9a870fc1c334bf7ca98e3ea13d27a575c5d32a1d87c118fa7029394ac678fdaf4c49a150596a7ec2f4f08dde4581cf213b3fca')

#prepare() {
  # skip tests that cause a coredump
#  sed -i '1i skip("dumps core")' "$_pkgname/tests/testthat/test-03_synteny_detection.R"
#}

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

#check() {
#  cd "$_pkgname/tests"
#  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
#}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
