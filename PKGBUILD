# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ENmix
_pkgver=1.40.2
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
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('13d61ea476496e9dd1c0f87933ee5ab1')
b2sums=('ef1f927ab3d8e8285c96b4ade53d631aa84d34888e68616af2873cac213f6b48f8ac1f0c404a19efcbe185c7ddf2e56db33a000a7d7bf26346bc111e4c0d3882')

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
