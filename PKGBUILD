# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cliqueMS
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Annotation of Isotopes, Adducts and Fragmentation Adducts for in-Source LC/MS Metabolomics Data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-coop
  r-igraph
  r-matrixstats
  r-msnbase
  r-rcpp
  r-slam
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
  r-biocparallel
  r-camera
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('01f79354495482e905124a3ce5f60e98')
b2sums=('42d8431bd50a717881ff8c036665082c361efa7e8fc2321e179f3478e58be942ce10d1b7bd7ded4f3d8836ddca0c73124ae799835ddc08c6f6467495acf6a1db')

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
