# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=interactiveDisplay
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Package for enabling powerful shiny web displays of Bioconductor objects"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-annotationdbi
  r-biocgenerics
  r-category
  r-ggplot2
  r-gridsvg
  r-interactivedisplaybase
  r-plyr
  r-rcolorbrewer
  r-reshape2
  r-shiny
  r-xml
)
optdepends=(
  r-biobase
  r-genomicranges
  r-ggbio
  r-go.db
  r-gostats
  r-gplots
  r-gviz
  r-hgu95av2.db
  r-knitr
  r-metagenomeseq
  r-rtracklayer
  r-runit
  r-summarizedexperiment
  r-vegan
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "fix-install.patch")
md5sums=('a58ec02cc262479f0fde58e20f8e9506'
         'f3e9aa31acfa87ff679676bd8e433bf8')
b2sums=('fc5a0b2215780ab9fa95add14035a6c55f4df046034ea09842f60ae17e88563bf357fb4dd9c046cf8059154067c238560818f8deb1f88363eb7450382993dc4e'
        'c0347a4e255e6123aa5a418b9432f001afee872b963a4b4b4cc9b38c3015718bd7944118e87dcc5b9f8f9ce9c85bcb3b49c0fef17d2293e2460a7eda2a98844b')

prepare() {
  # prevent unintended installing of BiocManager
  patch -Np1 -i fix-install.patch
}

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
