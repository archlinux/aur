# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=interactiveDisplay
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Package for enabling powerful shiny web displays of Bioconductor objects"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Artistic2.0)
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
sha256sums=('2a3e31639245081cd69f4c0c6396231a39b5477eda8362e956f221c266610171'
            'b97b524b191dca4ee18526716d5c5c9c0798558718835c7758a23eb5c547caac')

prepare() {
  # prevent unintended installing of BiocManager
  patch -Np1 -i fix-install.patch
}

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
