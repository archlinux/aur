# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SAIGEgds
_pkgver=2.8.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Scalable Implementation of Generalized mixed models using GDS files in Phenome-Wide Association Studies"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  blas
  lapack
  onetbb
  r-compquadform
  r-gdsfmt
  r-rcpp
  r-rcppparallel
  r-seqarray
  r-survey
)
makedepends=(
  r-rcpparmadillo
)
optdepends=(
  r-biocgenerics
  r-crayon
  r-ggmanh
  r-knitr
  r-markdown
  r-rmarkdown
  r-runit
  r-snprelate
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('589bf458efed530fc3e34ec420dd2127')
b2sums=('95088949cc3d59a7ef43891d304f99200d165193f5b3b71a5413560944b7841c9ce74badc8f87fcf229ac9bf87f3ff2b66504e2a012d3accf626733139a9a142')

prepare() {
  sed -i "$_pkgname"/src/Makevars \
    -e '/^PKG_CPPFLAGS[[:space:]]*=/ s/$/ -DHAVE_ATANPI=1/'
}
build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
