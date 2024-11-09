# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=scDesign3
_pkgver=1.4.0
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
md5sums=('7a2051e5737f93a928cfe0f983c7ba0f')
b2sums=('94f437a75340debd0de9717c40174877ab9726d1a984d948ecafb8c76c264c80436e20decc2332563579cd9e45590388dc0d9e4dcfded166767d8270c1f5ddf3')

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
