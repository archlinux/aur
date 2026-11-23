# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SAIGEgds
_pkgver=2.12.0
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
  r-skat
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
md5sums=('7a45dca7452b8deb0954218314c05c29')
b2sums=('7915c6d9a5a43abca0263119ddeb10a23e9a518fc7ea5c495b21510d632d46bd66d55ce32e16ea390eb09706afdcc6fa1c27d727199fa64fc12821165ed22a75')

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
