# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=compcodeR
_pkgver=1.44.0
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
md5sums=('9f675ee62816c80244be10b556a651b3')
b2sums=('7e0e1c51d211755f1dd2b81834c0dd09d1171cc2ce4a05a0016cc890bf1c552cf5ea752bb649c9fa4708d64f6a8efb18d4ae1b18f4940f57fd15634fd522d177')

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
