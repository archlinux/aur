# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=scDesign3
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A unified framework of realistic in silico data generation and statistical model inference for single-cell and spatial omics"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-biocparallel
  r-coop
  r-dplyr
  r-gamlss
  r-gamlss.dist
  r-ggplot2
  r-irlba
  r-matrixstats
  r-mclust
  r-mvtnorm
  r-pbmcapply
  r-singlecellexperiment
  r-sparsemvn
  r-summarizedexperiment
  r-tibble
  r-umap
  r-viridis
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-igraph
  r-knitr
  r-mvnfast
  r-refmanager
  r-rmarkdown
  r-rvinecopulib
  r-sessioninfo
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d67194f4336ba2ebb857bbf4348e61bf')
b2sums=('b546af4577def6491ecfcd592756213048a21d27185927ce6e772d032974eaf5d49bc78bd386dc7a5b1a7a86878a843b71e936ea8f1dc3b8c85415d72bb9dfa9')

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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
