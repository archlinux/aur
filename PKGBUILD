# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=iSEEde
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="iSEE extension for panels related to differential expression analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-deseq2
  r-edger
  r-isee
  r-s4vectors
  r-shiny
  r-summarizedexperiment
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-airway
  r-biocstyle
  r-covr
  r-knitr
  r-limma
  r-org.hs.eg.db
  r-refmanager
  r-rmarkdown
  r-scuttle
  r-sessioninfo
  r-statmod
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a0d88c17503afd3597c6ecb2e5aa1717')
b2sums=('bfb39f15005e77d28e2c5c366b6309215b3cfba1fc38f0dae5b97861d0996b056fb1e988454d398d54522cde6a88f8d736b14a7f01cef35ebdab1586188153c0')

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
