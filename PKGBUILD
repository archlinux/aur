# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=scDDboost
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A compositional model to assess expression changes from single-cell rna-seq data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-biocparallel
  r-ebseq
  r-ggplot2
  r-mclust
  r-oscope
  r-rcpp
  r-rcppeigen
  r-singlecellexperiment
  r-summarizedexperiment
)
makedepends=(
  r-bh
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('879bcde5add2c8cc271df031fb63ab17')
b2sums=('187acb2ef717912271b84003bee3910a2b80006f17da3be8acc7991e9301552cb166b053a7f0c87b87a74ba870e262756ba9c40094c690b331e19c0e66f6c719')

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
