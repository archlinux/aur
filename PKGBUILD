# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=syntenet
_pkgver=1.10.0
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
  r-rtracklayer
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
  r-rmarkdown
  r-testthat
  r-xml2
  r-networkd3
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f09df9c4c0dcf3091a2294f9f5668108')
b2sums=('076b4420ed8971ac7ad0d75e37574f1998ecddc160b8c2d43f33b22176a5be20a233f0dbf105afb5c6a75acec3bf30313b950920f4a8f3f04f38cc9af4640432')

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
