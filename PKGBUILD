# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SAIGEgds
_pkgver=2.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
md5sums=('6af4067c784be8427a793cde222b78b0')
b2sums=('e01b897be3442c5c84cec495c81922fc48b7471b1ef1d2658fc463c09f907fca10e70dc534a6bd5ae20379edf889414b2a759db44086827e2f2897a5394e47b8')

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
