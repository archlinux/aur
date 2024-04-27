# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=scDesign3
_pkgver=1.0.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="A unified framework of realistic in silico data generation and statistical model inference for single-cell and spatial omics"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-biocparallel
  r-dplyr
  r-gamlss
  r-gamlss.dist
  r-ggplot2
  r-irlba
  r-matrixstats
  r-mclust
  r-mvtnorm
  r-pbmcapply
  r-rvinecopulib
  r-singlecellexperiment
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
  r-sessioninfo
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f4f74c0f98ede2f2560f556dfb14074a')
b2sums=('b24855dc14095eceac59c92033cbde0acaec4dc735d7413c1845e4371384afef5bddb1b60d41ec025a1f78034657b8f0d31906c9c34f1a0f0e530f2a372dc31c')

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
