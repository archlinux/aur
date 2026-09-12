# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=compcodeR
_pkgver=1.48.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="RNAseq data simulation, differential expression analysis and performance comparison of differential expression methods"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-ape
  r-catools
  r-edger
  r-ggplot2
  r-gplots
  r-gtools
  r-knitr
  r-limma
  r-markdown
  r-matrixstats
  r-phylolm
  r-rmarkdown
  r-rocr
  r-shiny
  r-shinydashboard
  r-sm
  r-statip
  r-stringr
  r-vioplot
)
checkdepends=(
  r-ggtree
  r-phangorn
  r-phytools
  r-testthat
  r-tidytree
)
optdepends=(
  r-biocstyle
  r-covr
  r-deseq2
  r-ebseq
  r-genefilter
  r-ggtree
  r-nbpseq
  r-noiseq
  r-phangorn
  r-phytools
  r-statmod
  r-sva
  r-tcc
  r-testthat
  r-tidytree
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2ec7e8657486e0744e0d9b921ff9c30b')
b2sums=('80b55365c22ca25146fd0351c58161da016491f55c3ff18be354e9fcd3817a86edeb8d88a10225b8941aaf6045a49309aad8546cf570d2a9179002cf6a6d4626')

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
