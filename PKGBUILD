# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=compcodeR
_pkgver=1.40.0
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
md5sums=('6309c3d48d1b9d5f710490abc9169a1f')
b2sums=('776140cc097c4be70892117532eb7bbb11806d17c89cd802e5e3c2f50235ab6900faf811885068cfc9701e2eec28a8a850d3de05341954cf5ab3786399003990')

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
