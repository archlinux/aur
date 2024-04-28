# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=interactiveDisplay
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('4adec73e763df3dc2e697e41bff3ead8'
         'f3e9aa31acfa87ff679676bd8e433bf8')
b2sums=('f31e8b6fb6d9d9220975e1531111a29a6515d8283ecba1b8362da55946a7863ffaadd8f0bf3cc1993fcdc315f9eeb052f4b3f044a6f75125a7f4026d5aacd5c2'
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
