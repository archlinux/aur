# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SAIGEgds
_pkgver=2.14.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Scalable Implementation of Generalized Mixed Models Using GDS Files in Phenome-Wide Association Studies"
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
  r-biocstyle
  r-crayon
  r-ggmanh
  r-knitr
  r-markdown
  r-rmarkdown
  r-runit
  r-snprelate
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9a9d32ef6301d1d5b8f99d7eefa54969')
b2sums=('86251f6347256035861cfe9d16723f64750d59ad2e41aaea94473b4baffaaef213aaaeea00e2b603f44363466139809cd8ac0ac00dff62ddaace3984e945f791')

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
