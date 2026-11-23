# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=scrapper
_pkgver=1.6.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Bindings to C++ Libraries for Single-Cell Analysis"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  blas
  lapack
  r-beachmat
  r-biocneighbors
  r-delayedarray
  r-rcpp
  r-s4vectors
  r-sparsearray
)
makedepends=(
  r-assorthead
  r-rigraphlib
)
optdepends=(
  r-biocstyle
  r-igraph
  r-iranges
  r-knitr
  r-org.mm.eg.db
  r-rmarkdown
  r-scater
  r-scrnaseq
  r-singlecellexperiment
  r-summarizedexperiment
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('40e0127fb2a456d8ace5e092eb8f41ec')
b2sums=('67cc00833ae2a6ae81fa1e1024889bcd589708111905302b973c4656cffc082afdf1251b9c14fa1b318529d0258d7849b5162acda7c7e2fa4841e407a32f5568')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
