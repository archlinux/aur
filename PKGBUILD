# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=contiBAIT
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Improves Early Build Genome Assemblies using Strand-Seq Data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('BSD-2-Clause')
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
md5sums=('8297fd66bbfcd997be0f23cf31fcd644')
b2sums=('dfc4c8db3f7fb9af6c0d137f125c25c1650925724c540a4c387f40c9e47545e515aa189815bb2b9de7342432acc8148391d3e85c4cb5a61c1718561b232e6082')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
