# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ENmix
_pkgver=1.44.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Quality control and analysis tools for Illumina DNA methylation BeadChip"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-annotationhub
  r-biobase
  r-doparallel
  r-dynamictreecut
  r-experimenthub
  r-foreach
  r-genefilter
  r-geneplotter
  r-gplots
  r-gtools
  r-illuminaio
  r-impute
  r-iranges
  r-irlba
  r-matrixstats
  r-minfi
  r-quadprog
  r-rpmm
  r-s4vectors
  r-summarizedexperiment
)
checkdepends=(
  r-biocgenerics
  r-minfidata
  r-runit
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-knitr
  r-minfidata
  r-rmarkdown
  r-runit
)
source=("https://www.bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('007d9f4e9bc3ec3ccca4e9b53fde796a')
b2sums=('98d455b1de7047a29c5125aeae35f6e2bd74e3efd5c15774b8650f66f1472d1d6dbb0d58b7f32919957e016ccdb5c0940e0d92bca60f2fad8037f66af44cd193')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" Rscript --vanilla runTests.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
