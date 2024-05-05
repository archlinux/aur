# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=scDesign3
_pkgver=1.2.0
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
  r-rvinecopulib
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
  r-sessioninfo
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8ee455ffed57d35cfbf4605d48e4d976')
b2sums=('0db03c2643fd26e92b971d420027f4fd6825b56276f80d316f68b486c7bfb46da52e7ddc20f6d501647c1c0889526e28a901e8f374b50b3e733e9840c03d25d5')

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
