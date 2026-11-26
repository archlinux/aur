# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BiocSingular
_pkgver=1.30.0
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
md5sums=('c1803570ae046292d4cfdde6d70f5d45')
b2sums=('e6263846e7527348189338ba2577c4a4500413d0f1a42f35be51cee7fb38fc3bf5387bf9f2be8d924cc2eb9bdb0725e3109379e2bdca2f186e24c9b458986cf3')

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
