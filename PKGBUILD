# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=seriation
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Infrastructure for Ordering Objects Using Seriation"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-ca
  r-colorspace
  r-foreach
  r-gclus
  r-qap
  r-registry
  r-tsp
)
makedepends=(
  gcc-fortran
)
checkdepends=(
  r-dbscan
  r-dendextend
  r-ga
  r-rtsne
  r-testthat
  r-umap
)
optdepends=(
  r-cba
  r-corrgram
  r-corrplot
  r-corrr
  r-dbscan
  r-dendextend
  r-dendser
  r-doparallel
  r-dplyr
  r-dt
  r-ga
  r-ggplot2
  r-heatmaply
  r-keras
  r-knitr
  r-rmarkdown
  r-rtsne
  r-scales
  r-smacof
  r-tensorflow
  r-testthat
  r-umap
  r-vegan
  r-viridis
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ac4c3b71dc79d24196c7921254e92092')
b2sums=('b20341bc09db2fc17e7fb49c1ca55bd4bdc11264ab0d1f7f5edacd0befdc63991dfcaaad9d7d1da312b0f8dbd947b12f81b3f1c9b440967c81017b41727393d6')

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
