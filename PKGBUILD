# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=single
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Accurate consensus sequence from nanopore reads of a gene library"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(MIT)
depends=(
  r-biocgenerics
  r-biostrings
  r-dplyr
  r-genomicalignments
  r-iranges
  r-reshape2
  r-rlang
  r-rsamtools
  r-stringr
  r-tidyr
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('61242086622646ed92a4304d33bc1457')
sha256sums=('fabdd3503ab53c35e34b96b569b21bf1382cfe90cbe726b8163670476d23051b')

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
