# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cliqueMS
_pkgver=1.14.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Annotation of Isotopes, Adducts and Fragmentation Adducts for in-Source LC/MS Metabolomics Data"
arch=(x86_64)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL)
depends=(
  r-igraph
  r-matrixstats
  r-msnbase
  r-qlcmatrix
  r-rcpp
  r-xcms
)
makedepends=(
  r-bh
  r-rcpparmadillo
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-camera
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b31e1a08e0739c1270f414f3f7c84ab4')
sha256sums=('f4244f8e2fa272e58f25312e798e712777f2971835eeb7559dad8804fc5480e4')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
