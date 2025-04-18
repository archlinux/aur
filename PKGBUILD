# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BiocSingular
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Singular Value Decomposition for Bioconductor Packages"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-beachmat
  r-biocgenerics
  r-biocparallel
  r-delayedarray
  r-irlba
  r-rcpp
  r-rsvd
  r-s4vectors
  r-scaledmatrix
)
makedepends=(
  r-assorthead
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-residualmatrix
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('83a514d080f44452584f2904158efeac')
b2sums=('6814b64eb9ce113e63b2888f989e9fec6ac51f58f16671b6947897f5eea43599879f1f8a2670e72906ee511d1b432b1c30c555a750f10e3a653d0723564881ba')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
