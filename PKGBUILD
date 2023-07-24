# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=contiBAIT
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Improves Early Build Genome Assemblies using Strand-Seq Data"
arch=(x86_64)
url="https://bioconductor.org/packages/${_pkgname}"
license=(BSD)
depends=(
  r-bh
  r-biocgenerics
  r-biocparallel
  r-clue
  r-colorspace
  r-data.table
  r-diagram
  r-dnacopy
  r-exomecopy
  r-genomicalignments
  r-genomicfiles
  r-genomicranges
  r-ggplot2
  r-gplots
  r-gtools
  r-iranges
  r-rcpp
  r-reshape2
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-tsp
)
optdepends=(
  r-biocstyle
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('bc21baae59dc116f62b237e1690ac8ec')
sha256sums=('2c8e0e820233795cf0fb79798e6caf1d6b8bf7849114d20696a4541aff3993ba')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
