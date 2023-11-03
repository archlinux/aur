# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=compcodeR
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="RNAseq data simulation, differential expression analysis and performance comparison of differential expression methods"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL)
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
  r-modeest
  r-phylolm
  r-rmarkdown
  r-rocr
  r-shiny
  r-shinydashboard
  r-sm
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
md5sums=('b1ec77496e614cf3399843b8c34e6ab2')
sha256sums=('43ed456bf52146b00d9a4b83a84f86d15630b669048d0019bae230e3e9293e04')

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
}
